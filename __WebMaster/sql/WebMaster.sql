GO
USE [master]

GO
IF EXISTS(SELECT NAME FROM MASTER.dbo.sysdatabases WHERE name = 'WebMaster')
DROP DATABASE [WebMaster];

GO
create database [WebMaster]

GO
USE [WebMaster]

GO
CREATE TABLE Users(
	[firstName] varchar(50) NOT NULL,
	[lastName] varchar(50) NOT NULL,
	[email] varchar(100) PRIMARY KEY,
	[password] varchar(100) NOT NULL,
	[balance] float DEFAULT 0.0,
	[role] bit DEFAULT 0,
	[premium] bit DEFAULT 0
)


GO
CREATE TABLE Blogs(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[title] varchar(MAX) NOT NULL,
	[path] varchar(MAX) NOT NULL,
	[description] varchar(MAX)
)

GO
CREATE TABLE Product(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[productName] varchar(MAX) NOT NULL,
	[thumbnail] varchar(MAX) NOT NULL,
	[description] varchar(MAX),
	[type] varchar(100),
	[cost] float,
	[source] varchar(MAX) NOT NULL,
	[purchased] int DEFAULT 0,
	[rate] float DEFAULT 0,
)


GO
CREATE TABLE Cart(
	[id] int IDENTITY(1,1) PRIMARY KEY([ProductID],[email]),
	[ProductID] int FOREIGN KEY REFERENCES Product(id) ON DELETE CASCADE,
	[email] varchar(100) FOREIGN KEY REFERENCES Users(email) ON DELETE CASCADE
)

GO
CREATE TABLE [Purchased](
	[id] int IDENTITY(1,1) PRIMARY KEY([ProductID],[email]),
	[ProductID] int FOREIGN KEY REFERENCES Product(id) ON DELETE CASCADE,
	[email] varchar(100) FOREIGN KEY REFERENCES Users(email) ON DELETE CASCADE,
	[date] DATE
)

CREATE TABLE [Rate](
	PRIMARY KEY([ProductID],[email]),
	[ProductID] int FOREIGN KEY REFERENCES Product(id) ON DELETE CASCADE,
	[email] varchar(100) FOREIGN KEY REFERENCES Users(email) ON DELETE CASCADE,
	[rate] int,
)

GO
CREATE TRIGGER trgUpdateRate
ON Rate
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the rate in the Product table for the corresponding ProductID
    UPDATE Product
    SET rate = (
        SELECT AVG(rate)
        FROM Rate
        WHERE Rate.ProductID = Product.id
    )
    FROM Product
    INNER JOIN inserted ON Product.id = inserted.ProductID;
END;

GO
CREATE TRIGGER trgCountPurchased
ON Purchased
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the purchased count in the Product table for the corresponding ProductID
    UPDATE Product
    SET purchased = purchased + 1
    FROM Product
    INNER JOIN inserted ON Product.id = inserted.ProductID;
END;



--Insert Product
GO
INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('Database context', 'DBcontext.png', 'Java file contain all code need to connect to Database, you just need to extends it, easy to use, powerful to feel', 'Java file', 10.99, 'https://drive.google.com/file/d/1hjkCyZQfCgfDhVwngaQY_86Z8CLflRBx/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('My DAO', 'MyDAO.png', 'Java file contain DAO code to setup DAO system, extends from Database context you just need to copy and extend from it and use in your model class, easy to use and helpful', 'Java file', 10.00, 'https://drive.google.com/file/d/1CdZC5OSkl3MxkDZRY4RKXjU_Ic_HYPCI/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('Student DAO', 'StudentDAO.png', 'Java file, an example code which extends My DAO code, you just need to follow, very easy', 'Java file', 7.00, 'https://drive.google.com/file/d/1pvtKAb7AfDczrPeVZNvQf0acxagSZqlY/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost],[source])
VALUES ('WebMaster MainPage', 'WebMasterMainPage.png', 'HTML file, source HTML MainPage code of WebMaster page, you can download and just follow these code for your project if you want, using Bootstrap 5', 'HTML file', 25.00, 'https://drive.google.com/file/d/1rN50NVvEuMvCv6xazL8kEpJzDBUJMnHR/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('WebMaster navbar', 'WebMasterNavbar.png', 'JSP file, source navbar code of WebMaster page, you can download and just follow this code to make your own beautiful navbar for your page, using Bootstrap 5', 'JSP file', 30.99, 'https://drive.google.com/file/d/16tBDk7qw5ritGcPXzTtDNZQzhxKRmhxR/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('WebMaster Toast', 'WebMasterToast.png', 'JSP file, this is source code of WebMaster Toast, all packaged, you just need to include into your code and enjoy it, this can show notification from a session', 'JSP file', 29.99, 'https://drive.google.com/file/d/1FwUBkxWLYMV1h0t9PzFYyFb9QD9SlOSL/view?usp=sharing');

INSERT INTO Product([productName], [thumbnail], [description], [type], [cost], [source])
VALUES ('WebMaster Profile', 'WebMasterProfile.png', 'JSP file, which contain source code of WebMaster Profile, u just need to download and use in your project, easy, power and beuitful!, Bootstrap 5', 'JSP file', 15.99, 'https://drive.google.com/file/d/1wFBkC7hEWBe92gw70JR3534Fqjciq8b2/view?usp=sharing');

--INSERT BLOGS
GO
INSERT INTO Blogs([title], [path], [description])
VALUES ('Tools requirement for java web PRJ301', 'post/Tools requirement for java web PRJ301/', 'Tutorial, How to Install JDK 8u321, Apache Tomcat, Netbeans 13, SQL Server 2019, link download, these app is requirement for learning PRJ301 or PRJ302...');

INSERT INTO Blogs([title], [path], [description])
VALUES ('How to installing Apache Tomcat 10.0.18', 'post/Installing Apache Tomcat 10.0.18/', 'Tutorial, How to Install Apache Tomcat, link download, setup server apache tomcat,...');

INSERT INTO Blogs([title], [path], [description])
VALUES ('How to integrating Apache NetBeans IDE 13 with Apache Tomcat', 'post/Integrating Apache NetBeans IDE 13 with Apache Tomcat/', 'Tutorial, how to setup to integrating Apache NetBeans IDE 13 with Apache Tomcat for using server to run code, very important for start learning,..');

--INSERT USERS
GO
INSERT INTO Users([firstName], [lastName], [email], [password], [role], [premium])
VALUES ('Tran', 'Thu', 'doremon', '123123', 1, 1);

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Tien', 'Minh', 'minhtien', '123456');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Manh', 'Nguyen', 'manhzero03', '1111111');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Join', 'Xenos', 'xenosto30', '121212');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Kenny', 'Nguyen', 'kennyaot12', 'aot123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Conde', 'Jack', 'conde', 'conde');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Anny', 'Korp', 'anny', 'anny');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Surfae', 'Bik', 'Surfae', 'Surfae');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Menay', 'Kas', 'menay', 'menay');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Lan', 'Nguyen', 'lannguyen', 'lannguyen');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Minh', 'Hang', 'minhhang', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Jetis', 'Hang', 'jets', 'jets');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Jett', 'Kanto', 'Jett', 'Jett');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Micole', '1.5', 'micole', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Micola', 'Kanto', 'micola', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Coca', 'cola', 'cocacola', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Meracin', 'Mela', 'meracin', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Vo', 'dich', 'vodich', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Xavala', 'Jetis', 'xavala', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Thanh', 'Hang', 'thanhhang', '123123');

INSERT INTO Users([firstName], [lastName], [email], [password])
VALUES ('Tien', 'Nguyen', 'tiennguyen', '123123');