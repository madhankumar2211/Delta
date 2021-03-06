USE USER_PROFILE

create TABLE USERS_PROFILE(UserId INT IDENTITY(1001,1) PRIMARY KEY,
UserName VARCHAR(50) NOT NULL,Password VARCHAR(20),
EMail VARCHAR(50) NOT NULL, Phone INT NOT NULL,CreatedBy VARCHAR(20) NOT NULL,
CreateDate DATETIME NOT NULL, ModifiedBy VARCHAR(20) NOT NULL, ModifiedDate DATETIME NOT NULL,
RecordStatus BIT NOT NULL, RowGUID VARCHAR(MAX));


INSERT INTO USERS_PROFILE VALUES('Meyyappa',634512345,'Meyyappa@GMAIL.COM', 342353645, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
INSERT INTO USERS_PROFILE VALUES('Eshwanth',634512345,'Eshwanth@GMAIL.COM', 675768677, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
INSERT INTO USERS_PROFILE VALUES('Agila',634512345,'Agila@GMAIL.COM', 567676576, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
INSERT INTO USERS_PROFILE VALUES('Priya',634512345,'Priya@GMAIL.COM', 879645235, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
INSERT INTO USERS_PROFILE VALUES('Pooja',634512345,'Pooja@GMAIL.COM', 997653322, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
INSERT INTO USERS_PROFILE VALUES('Koushika',634512345,'Koushika@GMAIL.COM', 334665768, CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
select * from USERS_PROFILE



CREATE PROCEDURE [dbo].[CREATE_PROFILE_PROC]

@UserName VARCHAR(50),
@Password VARCHAR(20),
@EMail VARCHAR(100),
@Phone INT

AS
begin
INSERT INTO USERS_PROFILE VALUES(@UserName,@Password,@EMail,@Phone, 
CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID())
end



-- EXECUTE - CREATE_PROFILE_PROC
EXEC CREATE_PROFILE_PROC 'MADHAN',232423,'MADHAN@GMAIL.COM',214354
SELECT * FROM USERS_PROFILE
GO

-- CREATE - FORGOT_PSWD_PROC
-- PROCEDURE FOR UPDATE

CREATE PROCEDURE [dbo].[FORGOT_PSWD_PROC]
@UserId INT ,
@Password VARCHAR(20)
AS
begin
UPDATE USERS_PROFILE SET Password = @Password, ModifiedBy = CURRENT_USER, ModifiedDate = CURRENT_TIMESTAMP WHERE UserId = @UserId
end
-- EXECUTE - FORGOT_PSWD_PROC

EXEC FORGOT_PSWD_PROC 1007,'updated password'
GO


-- CREATE LOGIN_CHECK_PROC
-- PROCEDURE FOR SELECT

CREATE PROCEDURE [dbo].[LOGIN_CHECK_PROC]
@EMAIL VARCHAR(50),
@Password VARCHAR(20)
AS
begin
SELECT * FROM USERS_PROFILE WHERE EMail = @EMAIL AND Password = @Password
end

-- EXECUTE - LOGIN_CHECK_PROC
EXEC LOGIN_CHECK_PROC 'Eshwanth@GMAIL.COM', '634512345'
GO

-- CREATE DELETE_USER_PROC
-- PROCEDURE FOR DELETE
CREATE PROCEDURE [dbo].[DELETE_USER_PROC]
@USERID VARCHAR(50)
AS
begin
DELETE FROM USERS_PROFILE WHERE UserId = @USERID
end
-- EXECUTE - DELETE_USER_PROC

EXEC DELETE_USER_PROC @USERID=1007
GO

SELECT * FROM USERS_PROFILE