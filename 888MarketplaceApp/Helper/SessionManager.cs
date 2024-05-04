﻿using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.CodeDom;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static _888MarketplaceApp.Models.User;
using static System.Collections.Specialized.BitVector32;

namespace _888MarketplaceApp.Helper
{
    public enum SameSiteSetting
    {
        None,
        Lax,
        Strict
    }

    public class SessionManager
    {
        private static SessionManager instance;
        public static SessionManager Instance { get { return instance; } }

        static SessionManager()
        {
            instance = new SessionManager(TimeSpan.FromHours(1));
        }

        private readonly string _cookie;
        private readonly TimeSpan _sessionLength;
        private readonly ConcurrentDictionary<string, Session> _sessions = new ConcurrentDictionary<string, Session>();
        private readonly RandomNumberGenerator _tokenGenerator = RandomNumberGenerator.Create();

        /// <summary>
        ///     The name of the session token cookie. Defaults to 'token'
        /// </summary>
        public string TokenName = "token";

        /// <summary>
        ///     Constructor for SessionManager.
        /// </summary>
        /// <param name="sessionLength">The default length of a session</param>
        /// <param name="domain">The domain specified for the cookie</param>
        /// <param name="path">The path specified for the cookie</param>
        /// <param name="httpOnly">Whether the cookie should be unavailable to javascript</param>
        /// <param name="secure">Whether the session cookie only should be sent over secure (https) connections.</param>
        /// <param name="sameSite">The same-site policy specified for the cookie</param>
        private SessionManager(TimeSpan sessionLength, string domain = "", string path = "", bool httpOnly = true,
            bool secure = false, SameSiteSetting sameSite = SameSiteSetting.Strict)
        {
            _sessionLength = sessionLength;
            var d = domain == "" ? "" : $" Domain={domain};";
            var p = path == "" ? "" : $" Path={path};";
            var h = httpOnly ? " HttpOnly;" : "";
            var s = secure ? " Secure;" : "";
            var ss = sameSite == SameSiteSetting.None ? "" : $" SameSite={sameSite};";
            _cookie = $"{d}{p}{h}{s}{ss}";
            ExpiredCookie = $"{TokenName}=;{_cookie} Expires=Thu, 01 Jan 1970 00:00:00 GMT";
        }

        /// <summary>
        ///     Returns an expired cookie with the token name. Send with'Set-Cookie' header to make browsers delete the cookie
        /// </summary>
        public string ExpiredCookie { get; }

        /// <summary>
        ///     Determines if a token is a valid authentication token. Returns session data object through out paramenter if token is valid.
        /// </summary>
        /// <param name="token">Token to authenticate</param>
        /// <param name="data">Session data if token is valid</param>
        /// <returns>True if token is valid</returns>
        public bool TryAuthenticateToken(string token, out UserSessionModel data)
        {
            if (_sessions.TryGetValue(token, out var s))
            {
                if (s.Expires >= DateTime.UtcNow)
                {
                    data = s.SessionData;
                    return true;
                }
                _sessions.TryRemove(token, out _);
            }
            data = default(UserSessionModel);
            return false;
        }

        /// <summary>
        /// Method for creating reasonably secure tokens
        /// </summary>
        /// <returns>A cryptographically strong token</returns>
        private string GenerateToken()
        {
            var data = new byte[32];
            _tokenGenerator.GetBytes(data);
            var b64 = Convert.ToBase64String(data);
            var id = new StringBuilder(b64, 46);
            id.Replace('+', (char)_random.Next(97, 122));
            id.Replace('=', (char)_random.Next(97, 122));
            id.Replace('/', (char)_random.Next(97, 122));
            return id.ToString();
        }
        private readonly Random _random = new Random();

        /// <summary>
        ///     Creates a new session and returns the cookie to send the client with 'Set-Cookie' header.
        /// </summary>
        /// <param name="sessionData">Object that represents the session data</param>
        /// <returns>The string to send with 'Set-Cookie' header</returns>
        public string OpenSession(UserSessionModel sessionData)
        {
            var id = GenerateToken();
            var exp = DateTime.UtcNow.Add(_sessionLength);
            _sessions.TryAdd(id, new Session(sessionData, exp));
            return $"{TokenName}={id};{_cookie} Expires={exp:R}";
        }

        /// <summary>
        ///     Renews the expiration and token of an active session and returns the cookie to send the client with 'Set-Cookie' header. 
        ///     Returns empty string if token invalid
        /// </summary>
        /// <param name="existingToken">The existing authentication token to replace</param>
        /// <returns>The string to send with 'Set-Cookie' header</returns>
        public string RenewSession(string existingToken)
        {
            if (!_sessions.TryRemove(existingToken, out var sess))
                return "";
            var newToken = GenerateToken();
            sess.Expires = DateTime.UtcNow.Add(_sessionLength);
            _sessions.TryAdd(newToken, sess);
            return $"{TokenName}={newToken};{_cookie} Expires={sess.Expires:R}";
        }

        /// <summary>
        ///     Closes an active session so the token becomes invalid. Returns true if an active session was found
        /// </summary>
        /// <param name="token">The authentication token to invalidate</param>
        /// <param name="cookie">The cookie to return, to invalidate the existing cookie</param>
        /// <returns>Whether the session was found and closed</returns>
        public bool CloseSession(string token, out string cookie)
        {
            cookie = ExpiredCookie;
            return _sessions.TryRemove(token, out var s);
        }

        private class Session
        {
            internal Session(UserSessionModel UserSessionModel, DateTime exp)
            {
                SessionData = UserSessionModel;
                Expires = exp;
            }

            public UserSessionModel SessionData { get; }
            public DateTime Expires { get; set; }
        }

        public bool GetUserLoginState(HttpCookieCollection cookie)
        {
            var authToken = cookie[TokenName].Value;
            return TryAuthenticateToken(authToken, out var _);
        }


        public UserSessionModel GetLoggedInUser(HttpCookieCollection cookie)
        {
            var authToken = cookie[TokenName].Value;
            if (TryAuthenticateToken(authToken, out var sessionData))
            {
                return sessionData;
            }
            return UserSessionModel.empty;
        }
    }
}