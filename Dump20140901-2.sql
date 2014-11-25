CREATE DATABASE  IF NOT EXISTS `tintoreria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tintoreria`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: tintoreria
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalogo_servicios`
--

DROP TABLE IF EXISTS `catalogo_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_servicios` (
  `idcatalogo_servicios` int(11) NOT NULL AUTO_INCREMENT,
  `tiposervicio` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `porcentaje_var` double DEFAULT NULL,
  `Tipo_prenda` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcatalogo_servicios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_servicios`
--

LOCK TABLES `catalogo_servicios` WRITE;
/*!40000 ALTER TABLE `catalogo_servicios` DISABLE KEYS */;
INSERT INTO `catalogo_servicios` VALUES (1,'Lavado',150.5,10,'Algodon'),(2,'Planchado',80,20,'Lana'),(3,'Secado',40,10,'Piel'),(4,'Secado',40,20,'lana');
/*!40000 ALTER TABLE `catalogo_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Mario','Ramirez','Meza','Avila camacho 112','H'),(2,'Maria','Garza','Garza','Avila camacho 18','M'),(3,'Teresa','Eguia','Garza','Avila camacho 12','M');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `aparterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan Marcelo','Luvian','Mendoza','Fco. Morales 224','H','LuvianMarcelo@gmail.com','2281846199'),(2,'Roberto','Morales','Diaz','Xalapa 2000 224','H','Beto112@gmail.com','2283451234'),(3,'Erick','Gomez','Hernandez','Xalapa 2000 12','H','Richard@gmail.com','3295736476');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregas` (
  `ID_Entrega` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Notas` varchar(45) DEFAULT NULL,
  `Hora` varchar(45) DEFAULT NULL,
  `Empleados_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`ID_Entrega`),
  KEY `fk_Entregas_Empleados1_idx` (`Empleados_id_empleado`),
  CONSTRAINT `fk_Entregas_Empleados1` FOREIGN KEY (`Empleados_id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_servicios`
--

DROP TABLE IF EXISTS `lista_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_servicios` (
  `servicios_id_servicios` int(11) NOT NULL,
  `catalogo_servicios_idcatalogo_servicios` int(11) NOT NULL,
  `costo_parcial` double DEFAULT NULL,
  PRIMARY KEY (`servicios_id_servicios`,`catalogo_servicios_idcatalogo_servicios`),
  KEY `fk_servicios_has_catalogo_servicios_catalogo_servicios1_idx` (`catalogo_servicios_idcatalogo_servicios`),
  KEY `fk_servicios_has_catalogo_servicios_servicios1_idx` (`servicios_id_servicios`),
  CONSTRAINT `fk_servicios_has_catalogo_servicios_catalogo_servicios1` FOREIGN KEY (`catalogo_servicios_idcatalogo_servicios`) REFERENCES `catalogo_servicios` (`idcatalogo_servicios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_has_catalogo_servicios_servicios1` FOREIGN KEY (`servicios_id_servicios`) REFERENCES `servicios` (`id_servicios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_servicios`
--

LOCK TABLES `lista_servicios` WRITE;
/*!40000 ALTER TABLE `lista_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_servicios` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) DEFAULT NULL,
  `Empleados_id_empleado` int(11) NOT NULL,
  `clientes_id_clientes` int(11) NOT NULL,
  PRIMARY KEY (`id_servicios`),
  KEY `fk_servicios_Empleados1_idx` (`Empleados_id_empleado`),
  KEY `fk_servicios_clientes1_idx` (`clientes_id_clientes`),
  CONSTRAINT `fk_servicios_clientes1` FOREIGN KEY (`clientes_id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_Empleados1` FOREIGN KEY (`Empleados_id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `Empleados_id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_Usuarios_Empleados_idx` (`Empleados_id_empleado`),
  CONSTRAINT `fk_Usuarios_Empleados` FOREIGN KEY (`Empleados_id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Usuario1','contrasena1',1),(2,'Usuario2','contrasena2',2),(3,'Usuario3','contrasena3',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-01  8:35:19
