DROP TABLE [dbo].[Product_Order]
DROP TABLE [dbo].[Wishlist_Product]
DROP TABLE [dbo].[Cart_Product]
DROP TABLE [dbo].[Order]
DROP TABLE [dbo].[Delivery]
DROP TABLE [dbo].[Payment]
DROP TABLE [dbo].[Product]
DROP TABLE [dbo].[Cart]
DROP TABLE [dbo].[Wishlist]
DROP TABLE [dbo].[User]
DROP TABLE [dbo].[ShippingMethod]
DROP TABLE [dbo].[PaymentMethod]
DROP TABLE [dbo].[Category]
DROP TABLE [dbo].[Userrole]
DROP TABLE [dbo].[Review]
DROP TABLE [dbo].[Voucher]


CREATE TABLE [dbo].[Voucher] (
    [Id]     INT        IDENTITY (1, 1) NOT NULL,
    [Code]   CHAR (15)  NOT NULL,
    [Amount] FLOAT (53) NULL,
    CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Userrole] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Role] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Userrole] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Category] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[PaymentMethod] (
    [Id]          INT  IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR(20) NOT NULL,
    [Description] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ShippingMethod] (
    [Id]          INT  IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR(50) NOT NULL,
    [Description] VARCHAR(150) NOT NULL,
    CONSTRAINT [PK_ShippingMethod] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Review] (
    [Id]      INT  IDENTITY(1, 1) NOT NULL,
    [Rating]  INT  NOT NULL,
    [Content] TEXT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CHK_Rating] CHECK ([Rating] >= (1)
                                       AND [Rating] <= (5))
);

CREATE TABLE [dbo].[User] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [Username]           VARCHAR (50)  NOT NULL,
    [Email]              VARCHAR (50)  NOT NULL,
    [PasswordHash]       VARCHAR (MAX) NOT NULL,
    [DateCreated]        DATETIME2 (7) NOT NULL,
    [Userrole]           INT           NOT NULL,
    [FirstName]          VARCHAR (50)  NOT NULL,
    [LastName]           VARCHAR (50)  NOT NULL,
    [Phone]              VARCHAR (50)  NOT NULL,
    [Address]            VARCHAR (MAX) NOT NULL,
    [AccountVerified]    BIT           NOT NULL,
    [VerificationToken]  VARCHAR (50)  NULL,
    [VerificationExpire] DATETIME2 (7) NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_User_Userrole] FOREIGN KEY ([Userrole]) REFERENCES [dbo].[Userrole] ([Id])
);

CREATE TABLE [dbo].[Wishlist]
(
	[Id] INT IDENTITY (1, 1) NOT NULL, 
    [BuyerId] INT NOT NULL,
    CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Wishlist_BuyerId] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[User] ([Id]),
);

CREATE TABLE [dbo].[Cart]
(
	[Id] INT IDENTITY (1, 1) NOT NULL, 
    [BuyerId] INT NOT NULL,
    CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Cart_BuyerId] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[User] ([Id]),
);

CREATE TABLE [dbo].[Product] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [DateCreated] DATETIME2 (7) NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    [Price]       FLOAT (53)    NOT NULL,
    [Quantity]    INT           NOT NULL,
    [SellerId]    INT           NOT NULL,
    [CategoryId]  INT           NOT NULL,
    [ImagePaths] VARCHAR(MAX) NOT NULL, 
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Product_SellerId] FOREIGN KEY ([SellerId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Product_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id])
);



CREATE TABLE [dbo].[Wishlist_Product] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [WishlistId] INT NOT NULL,
    [ProductId]  INT NOT NULL,
    [Quantity]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Wishlist_Product_WishlistId] FOREIGN KEY ([WishlistId]) REFERENCES [dbo].[Wishlist] ([Id]),
    CONSTRAINT [FK_Wishlist_Product_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id])
);

CREATE TABLE [dbo].[Cart_Product] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [CartId]    INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Quantity]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Cart_Product_CartId] FOREIGN KEY ([CartId]) REFERENCES [dbo].[Cart] ([Id]),
    CONSTRAINT [FK_Cart_Product_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id])
);


CREATE TABLE [dbo].[Payment] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [PaymentMethodId] INT           NOT NULL,
    [PaymentAmount]   FLOAT (53)    NOT NULL,
    [PaymentDate]     DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Payment_PaymentMethodId] FOREIGN KEY ([PaymentMethodId]) REFERENCES [dbo].[PaymentMethod] ([Id])
);

CREATE TABLE [dbo].[Delivery] (
    [Id]                    INT           IDENTITY (1, 1) NOT NULL,
    [Address]               VARCHAR (MAX) NOT NULL,
    [Date]                  DATETIME2 (7) NOT NULL,
    [ShippingMethodId]      INT           NOT NULL,
    [EstimatedDeliveryDate] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Delivery_ShippingMethodId] FOREIGN KEY ([ShippingMethodId]) REFERENCES [dbo].[ShippingMethod] ([Id])
);

CREATE TABLE [dbo].[Order] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Date]       DATETIME2 (7) NOT NULL,
    [Amount]     FLOAT (53)    NOT NULL,
    [Status]     VARCHAR (20)  NOT NULL,
    [Note]       VARCHAR (MAX) NOT NULL,
    [BuyerId]    INT           NOT NULL,
    [PaymentId]  INT           NOT NULL,
    [DeliveryId] INT           NOT NULL,
    [VoucherId]  INT           NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Order_PaymentId] FOREIGN KEY ([PaymentId]) REFERENCES [dbo].[Payment] ([Id]),
    CONSTRAINT [FK_Order_DeliveryId] FOREIGN KEY ([DeliveryId]) REFERENCES [dbo].[Delivery] ([Id]),
    CONSTRAINT [FK_Order_VoucherId] FOREIGN KEY ([VoucherId]) REFERENCES [dbo].[Voucher] ([Id]),
    CONSTRAINT [FK_Order_BuyerId] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[User] ([Id])
);

CREATE TABLE [dbo].[Product_Order] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [OrderId]   INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Quantity]  INT NOT NULL,
    [ReviewId]  INT NULL,
    CONSTRAINT [PK_Product_Order] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Product_Order_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [FK_ReviewId] FOREIGN KEY ([ReviewId]) REFERENCES [dbo].[Review] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Product_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([Id])
);

TRUNCATE TABLE [dbo].[Product_Order];
TRUNCATE TABLE [dbo].[Cart_Product];
TRUNCATE TABLE [dbo].[Wishlist_Product];
TRUNCATE TABLE [dbo].[Order];
TRUNCATE TABLE [dbo].[Delivery];
TRUNCATE TABLE [dbo].[Payment];
TRUNCATE TABLE [dbo].[Product];
TRUNCATE TABLE [dbo].[Cart];
TRUNCATE TABLE [dbo].[Wishlist];
DELETE FROM [dbo].[User];  -- Since [User] is a reserved keyword, use DELETE instead of TRUNCATE
TRUNCATE TABLE [dbo].[Review];
TRUNCATE TABLE [dbo].[ShippingMethod];
TRUNCATE TABLE [dbo].[PaymentMethod];
TRUNCATE TABLE [dbo].[Category];
TRUNCATE TABLE [dbo].[Userrole];
TRUNCATE TABLE [dbo].[Voucher];

INSERT INTO [dbo].[Userrole] VALUES ('Member');
INSERT INTO [dbo].[Userrole] VALUES ('Admin');

DBCC CHECKIDENT ('Voucher', RESEED, 0)
GO

DBCC CHECKIDENT ('Userrole', RESEED, 0)
GO

DBCC CHECKIDENT ('Category', RESEED, 0)
GO

DBCC CHECKIDENT ('PaymentMethod', RESEED, 0)
GO

DBCC CHECKIDENT ('ShippingMethod', RESEED, 0)
GO

DBCC CHECKIDENT ('Review', RESEED, 0)
GO

DBCC CHECKIDENT ('User', RESEED, 0)
GO

DBCC CHECKIDENT ('Cart', RESEED, 0)
GO

DBCC CHECKIDENT ('Product', RESEED, 0)
GO

DBCC CHECKIDENT ('Payment', RESEED, 0)
GO

DBCC CHECKIDENT ('Delivery', RESEED, 0)
GO

DBCC CHECKIDENT ('Order', RESEED, 0)
GO

DBCC CHECKIDENT ('Wishlist_Product', RESEED, 0)
GO

DBCC CHECKIDENT ('Cart_Product', RESEED, 0)
GO

DBCC CHECKIDENT ('Product_Order', RESEED, 0)
GO