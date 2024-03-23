DROP TABLE [dbo].[Order]
DROP TABLE [dbo].[Delivery]
DROP TABLE [dbo].[Payment]
DROP TABLE [dbo].[ShippingMethod]
DROP TABLE [dbo].[PaymentMethod]
DROP TABLE [dbo].[Category]
DROP TABLE [dbo].[Product_Order]
DROP TABLE [dbo].[Product]
DROP TABLE [dbo].[User]

CREATE TABLE [dbo].[User] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Username]     VARCHAR (50)  NOT NULL,
    [Email]        VARCHAR (50)  NOT NULL,
    [PasswordHash] VARCHAR (MAX) NOT NULL,
    [DateCreated]  DATETIME2 (7) NOT NULL,
    [Role]         VARCHAR (50)  NOT NULL,
    [FirstName]    VARCHAR (50)  NOT NULL,
    [LastName]     VARCHAR (50)  NOT NULL,
    [Phone]        VARCHAR (50)  NOT NULL,
    [Address]      VARCHAR (MAX) NOT NULL,
    [VerificationToken] VARCHAR(50) NULL, 
    [VerificationExpire] DATETIME2 NULL, 
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Product] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [DateCreated]  DATETIME2 (7)   NOT NULL,
    [Name]         VARCHAR (50)    NOT NULL,
    [Description]  VARCHAR (MAX)   NOT NULL,
    [Price]        FLOAT (53)      NOT NULL,
    [Quantity]     INT             NOT NULL,
    [ProductImage] VARBINARY (MAX) NOT NULL,
    [SellerId]     INT             NOT NULL,
    [CategoryId]   INT             NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Product_SellerId] FOREIGN KEY ([SellerId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Product_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id])
);


CREATE TABLE [dbo].[Product_Order] (
    [OrderId]   INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Quantity]  INT NOT NULL,
    CONSTRAINT [PK_Product_Order] PRIMARY KEY CLUSTERED ([OrderId] ASC, [ProductId] ASC),
    CONSTRAINT [FK_Product_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([Id]),
    CONSTRAINT [FK_Product_Order_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id])
);


CREATE TABLE [dbo].[Category] (
    [Id]          INT  IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR(50) NOT NULL,
    [Description] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[PaymentMethod] (
    [Id]          INT  IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR(50) NOT NULL,
    [Description] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ShippingMethod] (
    [Id]          TINYINT  IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR(50) NOT NULL,
    [Description] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_ShippingMethod] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Payment] (
    [Id]              INT                IDENTITY (1, 1) NOT NULL,
    [PaymentMethodId] INT                NOT NULL,
    [PaymentAmount]   FLOAT (53)         NOT NULL,
    [PaymentDate]     DATETIME2 NOT NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Payment_PaymentMethodId] FOREIGN KEY ([PaymentMethodId]) REFERENCES [dbo].[PaymentMethod] ([Id])
);

CREATE TABLE [dbo].[Delivery] (
    [Id]                    INT                IDENTITY (1, 1) NOT NULL,
    [Address]               VARCHAR(MAX)               NOT NULL,
    [Status]                TINYINT                NOT NULL,
    [Date]                  DATETIME2 NOT NULL,
    [ShippingMethodId]      TINYINT                NOT NULL,
    [TrackingId]            VARCHAR(50)               NOT NULL,
    [EstimatedDeliveryDate] DATETIME2 NOT NULL,
    CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Delivery_ShippingMethodId] FOREIGN KEY ([ShippingMethodId]) REFERENCES [dbo].[ShippingMethod] ([Id])
);

CREATE TABLE [dbo].[Order] (
    [Id]         INT                IDENTITY (1, 1) NOT NULL,
    [Date]       DATETIME2 NOT NULL,
    [Amount]     FLOAT (53)         NOT NULL,
    [Note]       VARCHAR(MAX)               NOT NULL,
    [BuyerId]    INT                NOT NULL,
    [PaymentId]  INT                NOT NULL,
    [DeliveryId] INT                NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Order_BuyerId] FOREIGN KEY ([BuyerId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Order_PaymentId] FOREIGN KEY ([PaymentId]) REFERENCES [dbo].[Payment] ([Id]),
    CONSTRAINT [FK_Order_DeliveryId] FOREIGN KEY ([DeliveryId]) REFERENCES [dbo].[Delivery] ([Id])
);
