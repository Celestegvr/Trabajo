---------------------------------------------------------------------------------------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Gerente General] WITH PASSWORD=N'250401abi*/' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [Gerente General]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Gerente General]
GO
USE [EmpresaC]
GO
CREATE USER [Gerente General] FOR LOGIN [Gerente General]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Gerente General]
GO

USE [EmpresaC]
GO
CREATE USER [Gerenteg] FOR LOGIN [Gerente General] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
-----------------------------------------------------------------------------------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Gerente Ventas] WITH PASSWORD=N'250401abi*/', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
CREATE USER [Gerente Ventas] FOR LOGIN [Gerente Ventas]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Gerente Ventas]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Gerente Ventas]
GO

USE [EmpresaC]
GO
CREATE USER [GerenteV] FOR LOGIN [Gerente Ventas] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
USE [EmpresaC]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [GerenteV]
GO
USE [EmpresaC]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [GerenteV]
GO
USE [EmpresaC]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [GerenteV]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [GerenteV]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GerenteV]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [GerenteV]
GO
-------------------------------------------------------------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Gerente Administativo finanzas] WITH PASSWORD=N'250401abi*/' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [Gerente Administativo finanzas]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [Gerente Administativo finanzas]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [Gerente Administativo finanzas]
GO
USE [EmpresaC]
GO
CREATE USER [Gerente Administativo finanzas] FOR LOGIN [Gerente Administativo finanzas]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_owner] ADD MEMBER [Gerente Administativo finanzas]
GO
-------------------------------------------------------------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Resp ventas] WITH PASSWORD=N'250401abi*/', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [Resp ventas]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [Resp ventas]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [Resp ventas]
GO
USE [EmpresaC]
GO
CREATE USER [Resp ventas] FOR LOGIN [Resp ventas]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Resp ventas]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Resp ventas]
GO

------------------------------------------------------------------------------------------------------------------------------
USE [master]
GO
CREATE LOGIN [Resp Compra] WITH PASSWORD=N'250401abi*/', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [Resp Compra]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [Resp Compra]
GO
USE [EmpresaC]
GO
CREATE USER [Resp Compra] FOR LOGIN [Resp Compra]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Resp Compra]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Resp Compra]
GO
USE [EmpresaC]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Resp Compra]
GO
