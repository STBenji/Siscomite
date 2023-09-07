CREATE DATABASE  IF NOT EXISTS `siscomite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `siscomite`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: siscomite
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aprendices`
--

DROP TABLE IF EXISTS `aprendices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendices` (
  `id_aprendiz` int NOT NULL AUTO_INCREMENT,
  `nombres_aprendiz` varchar(100) NOT NULL,
  `apellidos_aprendiz` varchar(100) NOT NULL,
  `numero_documento_aprendiz` varchar(45) NOT NULL,
  `email_aprendiz_sena` varchar(300) NOT NULL,
  `email_aprendiz_personal` varchar(300) NOT NULL,
  `celular_aprendiz` varchar(20) NOT NULL,
  `fijo_aprendiz` varchar(20) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `id_documento` int NOT NULL,
  `id_ficha` int NOT NULL,
  PRIMARY KEY (`id_aprendiz`),
  KEY `id_documento` (`id_documento`),
  KEY `id_ficha` (`id_ficha`),
  CONSTRAINT `aprendices_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aprendices_ibfk_2` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendices`
--

LOCK TABLES `aprendices` WRITE;
/*!40000 ALTER TABLE `aprendices` DISABLE KEYS */;
INSERT INTO `aprendices` VALUES (1,'Cristian D','Bedoya T','','torres23torres@soy.sena.edu','torres23torres@gamil.com','3007030424','4512461','',1,1),(3,'Juan Carlos','Prasca','','prasca@soy.sena.edu.co','parasca85@gmail.com','30124242555',NULL,'',1,1),(4,'Juan Guillermo','Gomez','','jggomez319@soy.sena.edu.co','jggomez016@gmail.com','3195910996',NULL,'',1,1),(5,'Cristian David ','Bedoya T','1027944969','torres23torresTo@soy.sena.edu','torres23torresTo@gamil.com','3007030424',NULL,'',1,1),(6,'Juan Pepitos','Alcaraz','1027541224','pepito@soy.sena.edu.co','prpito994@gmail.com','3042155256',NULL,'',1,1),(7,'Cristian prueba','Bedoya T','1027944955','torresprueba@soy.sena.edu','torresprueba@gamil.com','3007030424',NULL,'EN FORMACIÓN',1,2),(8,'pepito','perez','1049857645','sdjhsudhs@gmail.com','','3028765434',NULL,'EN FORMACIÓN',4,1),(9,'Cristiano','Ronaldo','1071070107','cr7@cristiano.ronaldo.com','cr7@cristiano.ronaldo. sena','3007030424',NULL,'EN FORMACIÓN',1,1);
/*!40000 ALTER TABLE `aprendices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivos` (
  `id_archivo` int NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `ruta_archivo` varchar(255) DEFAULT NULL,
  `tipo_archivo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_archivo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
INSERT INTO `archivos` VALUES (13,'1693930387941-tablas siscomite.pdf','uploads/1693930387941-tablas siscomite.pdf','application/pdf');
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id_articulo` int NOT NULL AUTO_INCREMENT,
  `id_capitulo` int DEFAULT NULL,
  `numero_articulo` varchar(100) DEFAULT NULL,
  `descripcion_articulo` text,
  PRIMARY KEY (`id_articulo`),
  KEY `id_capitulo` (`id_capitulo`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulos` (`id_capitulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,1,'Artículo 1. Formación profesional integral.','La formación profesional que imparte el SENA, constituye un proceso educativo teórico-práctico de carácter integral, orientado al desarrollo de conocimientos técnicos, tecnológicos y de actitudes y valores para la convivencia social, que le permiten a la persona actuar crítica y creativamente en el mundo del trabajo y de la vida. '),(2,1,'Artículo 2. Comunidad educativa SENA.','En la Formación Profesional Integral participan diferentes actores,  cada uno de los cuales conoce y ejerce su rol dentro del proceso de formación profesional integral en el diseño, desarrollo y ejecución de la misma, entre los cuales están: los aprendices, instructores, personal administrativo y de apoyo, directivos y por extensión dentro del proceso formativo, la familia o acudientes, egresados, gremios de la producción, empresarios, instituciones educativas y representantes de los trabajadores, de los sectores económicos, la sociedad y del sistema nacional de ciencia, tecnología e innovación así como cooperantes internacionales.'),(3,1,'Artículo 3.  Aprendiz SENA.','Se considera Aprendiz SENA a toda persona matriculada en los programas de formación profesional de la entidad, en cualquier tipo de formación: Titulada o Complementaria, desde las diferentes modalidades Presencial, Virtual y a Distancia, que apropia, responsablemente competencias de manera integral que lo forman para contribuir al desarrollo personal, social y del mundo del trabajo, soportado en los valores morales, éticos culturales y ecológicos.                                                                                                                        El Aprendiz SENA es protagonista de su formación profesional integral, que se desarrolla a lo largo de la etapa lectiva y de la etapa productiva, en el caso de la formación titulada, en cualquiera de sus modalidades de formación y según los procedimientos institucionales.'),(4,3,'Artículo 8. Deberes del aprendiz SENA.','Se entiende por deber, la obligación legal, social y moral que compromete a la persona a cumplir con determinada actuación, asumiendo con responsabilidad todos sus actos, para propiciar la armonía, el respeto, la integración, el bienestar común, la sana convivencia, el servicio a los demás, la seguridad de las personas y de los bienes de la institución.                                                                                                                           Además de los consagrados en la constitución y la ley, el aprendiz SENA es responsable de cumplir con los siguientes deberes: '),(5,3,'Artículo 9. Prohibiciones.','Se considerarán prohibiciones para los Aprendices del SENA, las siguientes: ');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capitulos`
--

DROP TABLE IF EXISTS `capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos` (
  `id_capitulo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion_capitulo` text,
  PRIMARY KEY (`id_capitulo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos`
--

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;
INSERT INTO `capitulos` VALUES (1,'CAPÍTULO I. PRINCIPIOS GENERALES ',''),(2,'CAPÍTULO II. DERECHOS, ESTÍMULOS DEL APRENDIZ SENA',''),(3,'CAPÍTULO III. DEBERES Y PROHIBICIONES DEL APRENDIZ SENA',''),(4,'CAPÍTULO IV. TRÁMITES ACADÉMICOS Y ADMINISTRATIVOS','Los trámites académicos son aquellos pasos que los aprendices adelantan dentro del proceso de matrícula, formación y certificación, o para gestionar solicitudes de traslado, aplazamiento, reingreso y retiro voluntario.  '),(5,'CAPÍTULO V. INCUMPLIMIENTO Y DESERCIÓN',''),(6,'CAPÍTULO VI. FALTAS ACADÉMICAS Y DISCIPLINARIAS ',''),(7,'CAPÍTULO VII. MEDIDAS FORMATIVAS Y SANCIONES ',''),(8,'CAPÍTULO VIII. EVALUACIÓN ',''),(9,'CAPÍTULO IX. REPRESENTATIVIDAD DE LOS APRENDICES ','');
/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `id_documento` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (1,'C.C'),(2,'C.E'),(3,'T.I'),(4,'PEP');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichas`
--

DROP TABLE IF EXISTS `fichas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichas` (
  `id_ficha` int NOT NULL AUTO_INCREMENT,
  `numero_ficha` varchar(100) NOT NULL,
  `nombre_programa` varchar(100) NOT NULL,
  `jornada` varchar(100) NOT NULL,
  `etapa_programa` varchar(100) NOT NULL,
  `numero_trimestre` varchar(100) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `id_modalidad` int NOT NULL,
  `id_usuario_coordinador` int NOT NULL,
  PRIMARY KEY (`id_ficha`),
  KEY `id_modalidad` (`id_modalidad`),
  KEY `fk_usuario_coordinador` (`id_usuario_coordinador`),
  CONSTRAINT `fichas_ibfk_1` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidades` (`id_modalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_coordinador` FOREIGN KEY (`id_usuario_coordinador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichas`
--

LOCK TABLES `fichas` WRITE;
/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
INSERT INTO `fichas` VALUES (1,'2473196','ADSO','Mañana','Lectiva','4','',1,3),(2,'2664110','ADSI','Tarde','Lectiva','5','EN EJECUCIÓN',1,3);
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id_modalidad` int NOT NULL AUTO_INCREMENT,
  `nombre_modalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_modalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
INSERT INTO `modalidades` VALUES (1,'Presencial'),(2,'Virtual');
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numerales`
--

DROP TABLE IF EXISTS `numerales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numerales` (
  `id_numeral` int NOT NULL AUTO_INCREMENT,
  `id_articulo` int DEFAULT NULL,
  `numero_numeral` varchar(10) DEFAULT NULL,
  `descripcion_numeral` text,
  PRIMARY KEY (`id_numeral`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `numerales_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numerales`
--

LOCK TABLES `numerales` WRITE;
/*!40000 ALTER TABLE `numerales` DISABLE KEYS */;
INSERT INTO `numerales` VALUES (4,5,'1','Plagiar materiales, trabajos y demás documentos generados en los grupos de trabajo o producto del trabajo en equipo institucional, así como las fuentes bibliográficas consultadas en los diferentes soportes.'),(5,5,'2','Realizar fraude en evaluaciones, en el proceso de aprendizaje o en concursos, juegos o competencias de cualquier carácter. '),(6,5,'3','Aportar documentación o información que difiera con la real, para el ingreso a la entidad o para obtener cualquier beneficio de la misma. '),(7,5,'4','Suplantar identidad durante el proceso de formación. '),(8,5,'5','Alterar, adulterar, falsificar o sustraer documentos oficiales, calificaciones, evaluaciones o firmas correspondientes al SENA o emitidos por ella '),(9,5,'6','Utilizar de manera irresponsable el internet y las nuevas tecnologías dispuestas por el SENA para su proceso formativo.'),(10,5,'7','Fumar en áreas no permitidas en el centro de formación, así como ingresar, comercializar, promocionar, ingerir o suministrar bebidas alcohólicas o sustancias psicoactivas, dentro de las instalaciones del SENA, o ingresar a la entidad en estado que indique alteraciones ocasionadas por el consumo de estos.'),(11,5,'8','Ingresar o portar armas, objetos cortopunzantes, explosivos u otros artefactos que representen riesgo o puedan ser empleados para atentar contra la vida o la integridad física de las personas, para destruir o deteriorar la planta física o los bienes del SENA o de las instituciones con las cuales se adelanten actividades de aprendizaje, culturales, recreativas, deportivas y sociales. Los miembros de la fuerza pública y organismos de seguridad del Estado, que se encuentren en un proceso de aprendizaje, no podrán portar armas en el Centro de Formación. '),(12,5,'9','Utilizar el nombre del SENA, las instalaciones, el internet y nuevas tecnologías, para actividades particulares o con ánimo de lucro, exceptuando aquellas que sean parte de proyectos productivos aprobados por el Subdirector de Centro o la instancia competente.'),(13,5,'11','Destruir, sustraer, dañar total o parcialmente instalaciones físicas, equipos, materiales, software, elementos y dotación en general del SENA o de instituciones, empresas u otras entidades donde el aprendiz represente la entidad y/o se desarrollen actividades de aprendizaje, culturales, recreativas, deportivas y sociales o intercambios estudiantiles nacionales o internacionales. '),(14,5,'12','Obstaculizar el ingreso a las instalaciones de los Centros de Formación y/o perturbar el desarrollo normal de las actividades de aprendizaje, liderando o apoyando este tipo de actos en oficinas, ambientes de aprendizaje, zonas de descanso, bibliotecas y en general donde estas se desarrollen.'),(15,5,'13','Realizar acciones proselitistas de carácter político o religioso dentro de las instalaciones del SENA y demás ambientes donde se desarrollen actividades formativas, así como propiciar actos indecorosos, de acoso, maltrato físico y/o mental, o conductas que puedan afectar a cualquier miembro de la comunidad educativa. '),(16,5,'14','Permanecer con el uniforme acordado para el programa de formación de la especialidad, en situaciones o lugares ajenos al proceso de aprendizaje, que deterioren la imagen institucional. '),(17,5,'15','Generar, transmitir, publicar o enviar información confidencial, de circulación restringida, inadecuada, malintencionada, violenta, pornográfica, insultos o agresiones por los medios de comunicación físicos o electrónicos, disponibles para su proceso formativo.'),(18,5,'16','Todo acto que sabotee, perturbe o impida las actividades de formación, administrativas y de bienestar que se realicen en la entidad o en los sitios donde se le represente.'),(19,5,'17','Realizar comportamientos contrarios a la normativa SENA en lugares donde se adelanten eventos de formación nacional o internacional, que atenten contra la imagen del SENA o del país.'),(20,5,'18','Incumplir las normas de convivencia establecidas en cada Centro de Formación o Centro de convivencia.'),(21,5,'19','Ingresar o salir de cualquier instalación del Centro de Formación o de la entidad donde se desarrolle la formación, por sitios diferentes a la portería, saltando muros, cercas o violentando puertas, ventanas y cerraduras.'),(22,5,'20','Elaborar escritos o mensajes satíricos, dibujar y/o escribir sobre cualquier superficie, objeto o mueble de las instalaciones donde se desarrollan programas de formación; o pegar avisos, carteles, pancartas o análogos en sitios no autorizados.'),(23,5,'21','Propiciar conductas, propuestas o actos inmorales hacia cualquier miembro de la comunidad educativa, que atenten contra la integridad física, moral y/o psicológica.'),(24,4,'1','Suscribir al momento de asentar la matrícula el acta de compromiso como Aprendiz SENA.'),(25,4,'2','Conocer y cumplir con el código de integralidad, el reglamento del aprendiz, los manuales, lineamientos, procedimientos y demás normas del SENA y sus dependencias.'),(26,4,'3','Actuar siempre teniendo como base los principios, valores y procederes institucionales, interiorizando y expresando en sus actitudes y comportamientos los deberes del aprendiz SENA establecidos en este reglamento y asumidos en el momento de la matrícula; obrando con honestidad, respeto, responsabilidad, lealtad, justicia, compañerismo y solidaridad con la totalidad de los integrantes de la comunidad educativa y expresándose con respeto, cultura y educación, en forma directa, a través de medios, canales y/o espacios internos o externos que le facilita la entidad.'),(27,4,'4','Registrar en el sistema de gestión académico administrativo y/o otros aplicativos de la entidad, los datos básicos y de contacto, garantizando la veracidad de la información registrada.'),(28,4,'5','Actualizar de oficio o a solicitud de parte, la información reportada en los aplicativos del SENA en los que se adelanten trámites para aprendices, de acuerdo con la normatividad vigente.'),(29,4,'6','Cumplir con todas las actividades formativas propias de su proceso de aprendizaje según modalidad y del plan de mejoramiento, definidas durante su etapa lectiva y productiva; presentando puntualmente según el cronograma del Programa, las actividades y evidencias de aprendizaje establecidas para la ruta de aprendizaje.'),(30,4,'7','Acceder regularmente a los ambientes virtuales previstos para la formación y mantener una comunicación frecuente con el tutor.'),(31,4,'8','Ser reconocido con una condición de discapacidad y que el Centro de formación realice los ajustes razonables para brindar apoyo en el proceso formativo '),(32,4,'9','Participar en las actividades complementarias o de profundización, relacionadas con el programa de formación, con el fin de gestionar su proceso de aprendizaje.'),(33,4,'10','Dedicar al proceso de aprendizaje las horas semanales señaladas para cada programa, que permitan dar cumplimiento a las horas establecidas, teniendo en cuenta el cronograma y metodología establecidos por el Instructor-Tutor.'),(34,4,'11','Justificar debidamente inasistencias y/o incumplimientos a las actividades de la formación, comunicando oportunamente  al instructor o al ente responsable durante la etapa lectiva y productiva.'),(35,4,'12','Participar activamente en procesos de retroalimentación de la calidad de la formación y presentar oportunamente ante la coordinación académica las dificultades que se presenten en la ejecución de la formación, que no permitan la apropiación del conocimiento y un adecuado desempeño en cada competencia.'),(36,4,'13','Cumplir con la reglamentación y directrices que se emitan para su participación en actividades  programadas por el SENA,  como salidas, pasantías técnicas, intercambios de aprendices a nivel nacional e internacional, así como en las demás de carácter lúdico-pedagógico.'),(37,4,'14','Informar y hacer la solicitud, por escrito, al Coordinador Académico y registrar en el sistema de gestión de la formación oportunamente las solicitudes o novedades (Traslados, Aplazamiento, Retiro voluntario y Reingreso), que presente durante el proceso de aprendizaje, utilizando medios virtuales y/o físicos; para los programas de formación complementaria en modalidad virtual, realizar en los sistemas de información el retiro voluntario del programa o inscripción del mismo.'),(38,4,'15','Hacer uso apropiado de los ambientes de formación (infraestructura, equipos, herramientas, recursos didácticos, técnicos, tecnológicos, bibliográficos), disponibles para su proceso de aprendizaje, asumiendo responsabilidad legal en situaciones de utilización inadecuada y uso indebido, que deterioran los ambientes de aprendizaje y generan detrimento patrimonial. '),(39,4,'16','Participar en las reuniones que programe el Centro de Formación para seguimiento a las actividades desarrolladas durante el desarrollo de sus etapas formativas (lectiva y productiva). La no asistencia a estas reuniones debe justificarse mediante excusa comprobable.'),(40,4,'17','Respetar los derechos de autor en los materiales, trabajos, proyectos y demás documentos entregados y/o generados en el proceso formativo.'),(41,4,'18','Realizar personalmente las evaluaciones, investigaciones, actividades y prácticas de formación, haciendo uso de sus conocimientos, su esfuerzo personal, creatividad y autoría propia, absteniéndose de presentar como propios, escritos, documentos, ideas, o resultados que no sean de su autoría.'),(42,4,'19','Respetar los bienes y recursos culturales, naturales, físicos, digitales, de uso público y/o privado (en la entidad o fuera de ella) y velar por la conservación del ambiente sano, apoyando y/o colaborando en las acciones que adelante el Centro de Formación para su protección, conservación y buen uso.'),(43,4,'20','Usar apropiadamente y promover el uso de los elementos de protección personal que correspondan a la ejecución de su formación, aplicando las buenas prácticas de seguridad y salud en el trabajo definidas por la entidad y por la normatividad para cuidar de su vida, salud e integridad, prevenir riesgos y promover ambientes seguros y saludables. '),(44,4,'21','Cumplir con la reglamentación y directrices que se emitan por el SENA para la realización de la etapa productiva.'),(45,4,'22','Portar permanentemente y en lugar visible el documento que lo identifica como Aprendiz SENA, durante su proceso de aprendizaje, renovarlo de acuerdo con las disposiciones vigentes y devolverlo al finalizar el programa o cuando se presente retiro, aplazamiento o cancelación de la matrícula. En caso de pérdida de documento, el aprendiz debe formular la denuncia correspondiente, tramitar el duplicado y cancelar el valor respectivo con base en la normatividad dada por la Dirección General.'),(46,4,'23','Portar el uniforme de manera decorosa dentro del Centro de Formación, en los ambientes donde se desarrollen actividades extracurriculares y entornos diferentes al académico. Así como en el desarrollo de la etapa productiva, cuando la empresa patrocinadora lo exija.'),(47,4,'24','Ingresar a las plataformas virtuales institucionales, debidamente identificadas con el respectivo código de acceso, personal e intransferible. El usuario y la contraseña suministrado al aprendiz por la Entidad, para el acceso a las plataformas virtuales institucionales son de uso personal exclusivo, por lo tanto, no debe transferirse a otras personas. El mal uso de esta información es de su competencia directa y asumirá por ello las responsabilidades correspondientes.'),(48,4,'25','Hacer uso apropiado de los espacios y medios de comunicación institucionales y respetar a los integrantes de la comunidad educativa, siendo solidario, tolerante y veraz en la información que se publique en medios impresos o digitales; abstenerse de enviar material multimedia que contenga imágenes, videos, documentos o grabaciones que no sean objeto de las actividades de aprendizaje y cumplir a cabalidad la normatividad vigente del Estado colombiano en lo referente a delitos informáticos.'),(49,4,'26','Participar en los foros de discusión y demás espacios de socialización de los ambientes virtuales institucionales en los que desarrollan actividades formativas, siguiendo normas de comunicación digital, reconociendo, compartiendo y construyendo conocimiento con los integrantes de la comunidad educativa, contribuyendo con el aporte de conocimientos y destrezas en la solución y propuesta de los temas del programa.'),(50,4,'27','Informar al instructor, coordinador, directivo o personal de apoyo, cualquier irregularidad que comprometa el buen nombre y normal marcha del Centro de Formación de la entidad, sus ambientes y medios de formación y de la comunidad educativa, o que considere sospechosa dentro de la Institución y en los ambientes de aprendizaje, permitiendo una actuación oportuna, preventiva o correctiva.'),(51,4,'28','Obrar conforme al principio del respeto de los derechos de los demás evitando realizar y/o apoyar actos que limiten y/o afecten la dignidad, intimidad e integridad de los miembros de la comunidad educativa, como impedir el acceso a funcionarios y aprendices a los centros de formación y demás instalaciones del SENA.'),(52,4,'29','Asumir con compromiso las responsabilidades recibidas y más aún si son de representación de su grupo, del centro de formación, de la regional, o de la misma institución frente a otras entidades.'),(53,4,'30','Hacer entrega oportuna de  toda la documentación requerida para poder ingresar, formarse y certificarse en el SENA según programa de formación.');
/*!40000 ALTER TABLE `numerales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paragrafos`
--

DROP TABLE IF EXISTS `paragrafos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paragrafos` (
  `id_paragrafo` int NOT NULL AUTO_INCREMENT,
  `id_articulo` int DEFAULT NULL,
  `titulo_paragrafo` varchar(255) DEFAULT NULL,
  `descripcion_paragrafos` text,
  PRIMARY KEY (`id_paragrafo`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `paragrafos_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragrafos`
--

LOCK TABLES `paragrafos` WRITE;
/*!40000 ALTER TABLE `paragrafos` DISABLE KEYS */;
INSERT INTO `paragrafos` VALUES (1,1,'Parágrafo','Se desccribe algo'),(2,4,'Parágrafo','Para el caso de los aprendices en condición de discapacidad, además de los deberes enunciados, deberá: '),(3,4,'Parágrafo 1','Poner en conocimiento oportunamente al Centro de formación sobre cualquier condición de discapacidad, para proceder a la gestión de los ajustes razonables pertinentes.'),(4,4,'Parágrafo 2','Procurar por el cuidado de su salud y el bienestar de la comunidad, garantizando el cumplimiento de tratamientos médicos o procesos de rehabilitación establecidos por las instancias de salud tratantes.'),(5,4,'Parágrafo 3','Hacer partícipe a la familia y/o cuidador en los procesos de acompañamiento institucional como apoyo a su proceso formativo siempre y cuando se requiera.');
/*!40000 ALTER TABLE `paragrafos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Coordinador'),(2,'Instructor'),(3,'Administrador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `tipo_solicitud` varchar(100) NOT NULL,
  `nombre_coordinacion` varchar(200) NOT NULL,
  `id_usuario_solicitante` int NOT NULL,
  `id_aprendiz` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `categoria_causa` varchar(255) NOT NULL,
  `calificacion_causa` varchar(255) NOT NULL,
  `descripcion_caso` varchar(2000) NOT NULL,
  `id_archivo` int DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `fk_solicitud_1` (`id_usuario_solicitante`),
  KEY `id_aprendiz` (`id_aprendiz`),
  KEY `fk_archivo` (`id_archivo`),
  CONSTRAINT `fk_archivo` FOREIGN KEY (`id_archivo`) REFERENCES `archivos` (`id_archivo`),
  CONSTRAINT `fk_solicitud_1` FOREIGN KEY (`id_usuario_solicitante`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendices` (`id_aprendiz`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (4,'Individual','Marianela',4,4,'Pendiente','2023-08-31 20:30:43','Disciplinaria','Grave','Descripción del caso...',NULL);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_numeral`
--

DROP TABLE IF EXISTS `solicitud_numeral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_numeral` (
  `id_solicitud_numeral` int NOT NULL,
  `id_solicitud` int DEFAULT NULL,
  `id_numeral` int DEFAULT NULL,
  PRIMARY KEY (`id_solicitud_numeral`),
  KEY `id_solicitud` (`id_solicitud`),
  KEY `id_numeral` (`id_numeral`),
  CONSTRAINT `solicitud_numeral_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`),
  CONSTRAINT `solicitud_numeral_ibfk_2` FOREIGN KEY (`id_numeral`) REFERENCES `numerales` (`id_numeral`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_numeral`
--

LOCK TABLES `solicitud_numeral` WRITE;
/*!40000 ALTER TABLE `solicitud_numeral` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_numeral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `numero_documento` varchar(100) NOT NULL,
  `email_sena` varchar(300) NOT NULL,
  `email_personal` varchar(300) DEFAULT NULL,
  `numero_celular` varchar(20) NOT NULL,
  `telefono_fijo` varchar(20) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `id_documento` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'cristian david','Bedoya Torres','1027944969','bedoya969@soy.sena.edu',NULL,'3007030424',NULL,'','$2a$10$DZvyLyvnd4b/oiwOHe/fiuu5jce2kNPgmIB53KPckhjzziGnclRq6',1,1),(4,'cristian ','Bedoya ','1027944956','bedoya956@soy.sena.edu',NULL,'3007030424',NULL,'','$2a$10$O1zLg2.YqZtNbR9DmUwkRO207FuzZ69JpdpI2kwRkmU9JkhaoZzJu',1,2),(5,'Juan Carlos ','Prasca Medina ','1063355027','prasca07@soy.sena.edu',NULL,'3004984546',NULL,'','$2a$10$Q1Sw/kfD0p4NFchNsGowauXAvqMhVKNIPgSUQAFr5CkNr2cEwtzWG',1,2),(7,'cristian Prueba','Bedoya Prueba','1027944970','bedoyaprueba@soy.sena.edu',NULL,'3007030425',NULL,'ACTIVO','$2a$10$rirSMtMHGqWuWxAyucGY/OxDOGtiWAg7BbHmry9SBzHyxu0cirkUS',1,2),(8,'David','Torres','1010101010','torres@soy.sena.edu',NULL,'3007030424',NULL,'ACTIVO','$2a$10$0jE5eg39maDwPlXJnpuUteQFIA.s/36dBQC6NuYYkKyIVDSm5h4ma',1,2),(9,'David','Torres','101010101','torres@soy.sena.edu',NULL,'3007030424',NULL,'ACTIVO','$2a$10$17zhj7Y3XI5M85mdZ.KmaeBsxBODypjeYJ8L7KcJW./h3/oe4NIOG',1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'siscomite'
--

--
-- Dumping routines for database 'siscomite'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-05 11:16:05
