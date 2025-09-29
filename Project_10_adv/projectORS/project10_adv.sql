-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: project_10
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `ncs_attachment`
--

DROP TABLE IF EXISTS `ncs_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ncs_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncs_attachment`
--

LOCK TABLES `ncs_attachment` WRITE;
/*!40000 ALTER TABLE `ncs_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ncs_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_attachment`
--

DROP TABLE IF EXISTS `st_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime(6) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `doc` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_attachment`
--

LOCK TABLES `st_attachment` WRITE;
/*!40000 ALTER TABLE `st_attachment` DISABLE KEYS */;
INSERT INTO `st_attachment` VALUES (16,'root@sunilos.com','2024-10-01 01:52:11.377000','root@sunilos.com','2024-10-01 01:52:11.377000',0,'root','Profile picture',NULL,'download (4).jpeg','/User/profilePic/79',NULL,'image/jpeg',79,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	 \Z !\Z( \Z\"&!1\"1)+/..383-7(-.+\n\n\n\r.%&--5-///+-80-5--+-07----0--//-/--/.---+---+-+-+-5-5ÿÀ\0\0\È\0ü\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0N\0\r\0\0\0!1\"AQa2q#BR‘3Sr¡CTbd‚’“”¢±\Ò\Ó$²³Á\Ñ5\Ã\áñ4csƒ\Âÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0\0!1AQaqğ\"2±Á#‘¡\Ñ\áñRÿ\Ú\0\0\0?\0\î4¥()JP\í\Â&¹¶+\è™II\n\ädvo‚;¬	„†\ê*~”\à<fú\'qmp\é*Mcz^P‡ou‰Ö«\âFqÒ®\Õ\"kûimOŒŠ;xNø\ä\Z†|´\Ô÷7òM¥şõE:~n\â#¦Eô\Ï\Ú]\Î\Ç\Ì\ã\Ír¯¥\ßÚ«¸»hQå§„w“C´d\É€:uj`¹©\Ê}‡h\àü\Ãgt3oq¾a>#¨ùŠ“®	\'.ğû¥Y¢I\İe€\è õ\Î\Ûg>c\"¶\ìù¯‹p²®o¬Ç¼[ó\Ñ=]OÌ‘·\Ù\ëL“¸R´8‚\î¸\Ã\Æ\ã 0Gb+~ ‘JR€R” ¥@ó7\ÙY\äM/|)n\Íw\Ó÷Š¯º»{Í\ë@ORµ8Mÿ\0o\nL#’0\ãPY\0W\0ô\È\ã#|gÆ¶\è)JJR€R” ¥()JJR€R” ¥()JT+cşõ~¾\åq\é›{f?´“ó«\ís/h\×s’\İNW\Õc\ÓnÏ±\ÏÎ¹\Ûòšt«õ^1\ÊL\×6C»ÀN\"Ÿ\Ïn‘¿“\r¼ñ’k\r\â2·t£©\Ó$n0Ñ·Š°ÿ\0ĞŠº\Ô2pVr.mÀ(1Œ\àNLL\áo²qáš¥v\ãfv\Ôi“ø£\É]\à\×\ÍÁ®L\é“a1\â!“\Ø1\ØL£\ËÀ\á·\İ\ÇpŠE`H €A ƒ¸#Î¹¼\Ñ\Ïq”pAVd`|AÊ‘\æ\rMû5\â†<2V\ÊaÑ˜\ä”¼>1\ç#®Pøi­-zgF¥Fñ\Ş;kgkq*Æ½z±ûª£¼\ç\Ğk›s:\ßÜ«x¥‚€.\Ä\Û}\ãÜµ\ï¹}¶Áª’]y§m¬ò›\Ë8\Æ!M\ÎN\ÊŒ\é\Ôz\rÙ·Ò­Š”\å\æº0+\İYŸ¼È½\"\ÏHóöŠŒs¹\Î6À®S\Êh¶\Ì\'k7–\àgHy#H¡\'\Ş)¥¤fv\èÒ°\ÖŞƒc\ë9ò\îh\r¸6¶š\Èy™\n}¤\\\Â4\ÓVÂ§\0°s/:\Ë4k\Ã\Ø*¡+5\Ö\Ä)ñvgó}\ÂúœV‡$ò\Üs\ÎÄ©0@\à¹bY®n=\îû6\î#\Èc¬T}‚*Ÿ3E:\"Š1¥p‚9¡d\ĞK²\Ô\à“ñ«¯,sz$\ÚX$sI\Z÷\Úi„&G=ùP+HÀ»±\n7Øš†\ÒA&\Ş¡J\çK\Ï÷ÑŸ®±FP{İ„\ä¸ó\Â\É\Z†>š…\\9s˜m¯b\ím\ßP«)Z6Q”\î¤ñ‘\\\ál\'ò¼—”%™´¥+¡AJR€R” ¥()JJR€R” ¥()JxÑ´³’D\Şf\Äp/‹Jı\ÈÀó\Ü\çà¦ x=‚\ÛÁ¸s\æ@İ¾g\'\çQüFû\é\ÜU€9·\áı\Ñ\ä÷,0Ç®f¹_0\Äù\Ô\åg¶Yx=\r$0œ…)J\äl*üR×±¹\Ô=ËŒœyJ£½ı4ø\Ä\Ç\íV½õ»8DˆÁ\ânQÇº\ØñA ‘\ãS|ÌŸRuIaa\é—X\Ûûÿ\0F\Ö\Ê^by\Z¨tÙ±\"«^];<ê§´–c¬\ÆFr¨\0W\'º\r@1\\\Òÿ\0˜\ï®&=„·\Ïuqú±€>[\ã\Ìõ®—\Íö\å\í]UC3U¦¦`ŠOZ¾ \n\ËÁ8DqL¶·=]ºoñ\'}v«´p+\\µ\Ä\î\æ\rmsn(\Z¸Rš“!Nİ™\ÔA#Ë­l\Ée,,XZGı%«J?¤¨2 Â­…\Óv8\Z3œ\í£nğ9\İv\ëšñ%ÁÜ¢4H\åJs‡\Üå³† ’±\Ğ+Qñš[(Ì‹*µ\Â3vl¾¨\n¶3¾–#B\ïBk©°\r\Ôg\ãÿ\0½se\åæ˜¤¶\ì°\Ü)È˜V\Æ\ÆS¯\Ç}²<k\'³®#\ÄR\âK+\Âd5£³j`3Œ\ä÷Lı“¤mš\ãt\ÜÙ¥¶1}/´¸q\Ë<©•GyGxKğH\ê<úyb¤÷\íapœF”\î­\Ò.\âX\Úğ:²g ùx\ã9\èYªeÕª¬“[\n{Ê¾)5wq\äH€y ¯.ü\Ó%|{9ñFùÁMt>\Ş<Î¿o2º«¡¬)‚\È#ĞŠ\ÉTdE¾-„™,\ßB“Õ¡nô-øeq\á¤Uş½x\ÉIe;M<1^&•QK³U–b\0\0nI\'`=kZ~%Ê°–B¥ô‚2¨:»}\Õ\Î|Iø\ãœó/ú{\áúD  ğ¸a¸”Á÷\Ú=ÿ\0¸k•÷Æ˜uÈ½UJ\Ét¢~\ã\Ú9ú‹y\çO\Ò/fŠß«Úº³\\i>Ô·\0\æ«k¦1©h\æQ†PÀû\Ã«\rJHuÏ«KŠ@\åD‘3\Ä{H\\uWê·º\Ã\Ä^U^\Ör³Kø7Ù J‹\Ü\ít¨\ÎZ\â\ëwkÒŒ	Q[t’;\Ëò9*“¯ló)JJR€R” ¥(Bs§VS\İf4:Añs\İAób*n¹Oş!®›\è–\Ö\àã¶œg\Ô(;~,§\å@zö}ÃŒ6jÉ’Pf‘Vi;\Ù9\ß:t•X\è(\Ò:\r‡ÀmQC˜¢Š*K3xD€…>EØªü]Yô¬{É\Âq®+$½ctbÊ¬!€ •$d\äq¾=GW¸2\æ\Ş]$3\Ó•W\ßbe,„\ê`t\ç;t¬¡s2OjÍ¥µ$‘j;È†8Ñ˜\ï\Ñ·[>9«t<6S\ß\Å\ÍE>Iel[·«Â¿Œ±¯ıj.³ñ%® \Õ\Ù<¡N­ ¡I-†®úV\n\ÑB\ÄL:¹\'fÇ—@zùƒøn*C“¬\Ä\Ò\Ér\Ã+¡\Ç\ëdø\äö`õ\ZdûÆ´sS\\2E\Ãm\È]i\Ú»´ŒÒŸS»\Zá¯±Æ¬.Ó•X\ÎY÷›øza.\Â&ŒÏ·`I?¨{ß¨$_µ[–\\=biH\ÜHú±…\ZTišµ·ó\È\éRC²š2»28*Ş ŒGÀô¨R\Î\ç.«Ù¹>-0¹ù²\\´¹A\Åör\\¢ºm¥‰iÁ\Ş\'Y\Ã–A\æ5]÷:‰\è­.#tah\ï#\ÃCö€`ê‰´ö€z!ÇªcÆ®\É\Ëv\í\Òi\à\\y…a;šB\ã\çZ\Ü\ád¢D—Ù³ƒ[Idc\à;ª\èOÕZ§tT\Õo´¬S\ÇR\ì$£pÀ2T€A;ƒøU{™‹ˆXth\æVø†‰“ö?\Zû\ìöVn\0c’\ãùF\ïıŠ+\×3°\í-\×\Ç\ë›\ä)ı®µƒR¿NKÁ\Äe•\äB=\ì\Öw	{«=Œ\Êå‚”b\n¹\Ò46\ä\à\ìO@*v\ã™x”€†–(‡”1œú‚\Ò1\Ï\ÉTú\Ô{\0F\àõ­[\×` \ËurFq\â\Í\ÕTm’7$\è|Êµ—t*\âñ±3\Ó\×\Ô\ç%“^\ë\é‘\ÒE˜\æcª0ò`\åC]N€m§P\È\ÎCjlà±™¤$%\È\Ô=\äh\Ø:üU\Øñ\Æ+0\áòu{™uš4\"/`ƒü\â\İ+%ÿ\0p5edOvDÙ\à©\ëıÓ±ñ«KSÔ’œ³\ãŒÿ\0³\ËDFœ?…c\Ã?Ñ’8\î\ï\":ù(b?»[kQ|\"úMMo>;d©œ	\0ğòa\à}Û¼B\èE\É\×J’\0\êO\ÙQ\êN\0õ5’\È\É\ÍE¥Ÿ\ÓDeœıË±ÿ\0üµ{«-\È_‡m\'ı\Í]j‘81³°··o}S/¾{\ìKÉ¿yš§«\ë—\Ï1JR¤\nR””¥\0¥)@+“\â&\Ñş‰mp£=Œ\Ûúj\é•\æ+¬\Ôo1ph¯-¥µ”w%R¤\í•=U†|T€G¨ +–\×\",Šr®ª\ê|\Ã\0Àş«|Áme	P¶ÿ\0Zù`-Ã£`ó·b50\É\é†\ÔOLj#C–ø¿\îz?¿%f¶!bÂ³ˆ˜Í£\n	·@qƒ\é9\íó\ØÚˆÁûw/ƒñ\ì\â\É?\Ëò¬ñ„“\Øôgur†\ïòiğ»Õ2\ë,\é€á‘¢q\×R0dx\ã–ö\Æ†™cGpC`ùŒô¬bÉ^\Şi;I4„î¨‚X\r#%·$÷™±\áŠİ­k8\Üó3±†\Ö\Õ#\ZQUG€P\0€ŸûŸ:\Èùğ\Ç\Ì\ãş•\ê•$\Z­z€„“1–8½\Ö>A½Üœì¤‚|ª:\ï˜cµ\áö(c¢¢½K€u\rúcN\ç\ĞT\Ä\Ñ+)V”Œ@ \"Z\æ\Ñl†%9·\Õ#Gœ\å	ÁtÏˆ\É\Ô3¾\ì7\Åf\ÔP­I>!®¥ƒ³rY“ZgDˆ\Ô`\é ú\ïƒğ¬œ¢\İ\Éğ3\Şğ73\â«\É\æü;\él±C4‡õu³şĞ¿¶®»f\Ğ\ÚÁû\ë\Zı|eÿ\0¼Z²h«\éœñ\Æq÷&;A/x\â“*\Ïl\Í\Ñ\Ò|\Ämÿ\0šGÎµ¹ˆ,\ÖlÀi)5© \ï·o>*X~5_ö½\Äd¶·†xı\ím?wZúû†´xUû\Üp Í¼“õ7y\â có«j+—¿„\×KòJœ“K°\Ù\ä^7V‡\ên\Õğ±Hù\Õ#¸\İAQ±H¬\ÒNóJgu\Ñ\İ	\Z‹œ’\År51\Æ@$\0Š2pI\Ñ\åÀ>‰o”_ğŒşÚ’¯U¬”ú¡Œoù=újJ1mö\nğp2\Çm·\'ÀŸûÖ½\Ç…	R\ãPû*·\î¨-¹ô¯v·Ã´ñ\éŠ?­v™\Ö$Ò½÷œe\Êh\ß8\ÆõÂ<ì’1Ÿ_Rö]Å¾\ãvÿ\0‚\Ş%±½eE0\\\ÆÚ„š1¼‡l)U,\Ú0IJ\èÖ†=#\ÏRO™\'$ş\'§…\\y†\ê\ê^<¡­‚=¼„i\í\'+!\Ò¾¯\Ş\ÈÁ\ÒzôªH‚OOóUüA«´4õ\Õ¨\íûú\ífM%Ó›“–\æ—0Dt¬È¥¥…µ¨Q’\Ë\ÒDø2\ç\æ­|ŸÀş•\"\\¸ÿ\0vŒ‡ˆ\ß\Ü{²côi\Ô}\æÁ(-_–\'±$¤€	Â¡\Ò	\Ò´Ç°\É\ë\èj\ã\ì¾)Z\ÅI•\Â,—	\Z}ÕšP3©26\Â\ã\ÃO®_gR¥‰K|q\ë\íõ9\ë,k)vò^)XãŒ¬[\ã§ş€VJöO8R” ¥()JJR€PÒ¹_>ó,·s¿\rµr‘Gµ\ä\Êw?\É\Ğøö\Äx@‚\ãHò\Ü\È\Ğ\ŞeÕ‰®R\Ñ\É=„e‹\ë\Ò04®ub[c½	e\0‘ÿ\0Œ\Å7õ;Œ|”|+-­²F‹\Z(UQ€@+5]\"­š%\ÇÙ?œ¬?`ˆÿ\0y\Í\×İ‡úOşJİ¬S@¯³#œˆ\è~u$\Zo%\Ø\èŒ²/ş‘¯b\æ\àµ¾ür«\Ì	Z÷|\"Á\í \nªYeÀ“\Ó\ÈUÏ‚û4\áı‚m‚\ÌÀ3öo$ZI\à1²\ä/»\ëŒõ5\r\àJ²ßµG*\àP¶>&=J>9¨ó\Ã\à\âwö\Ö_œ‰;In464(Rª¤¯B\\£jö\Ñ\Ë\Òğö†[i\î\ŞP\È\Êf•´¸ß«6p\Êv\Ä>uoö-\Åxd¶E;(b6®¬fC¾™u9,s¿\Ä`P\Ù8\'\Ï ˜P%­Ì‚0c=„\Úd„d2¦ ¨6h5acyG˜›‰‰\ZÙ­\ÑQ´é‘™\åm‡|¢\éĞ§pNpzt«ı³\Çöd\r\é¯W\í$Ÿ\ÛT>zöKgxkp-\î‰\ÔrÛ¯}GLŸ´7\É\Îı*‰%Á&´®4–ŸE™´™\Õmš7<\Ã,¨\ÂM= A\Ë\r÷ \à>ÊœN\Ş\Ö\Ö\Ù…°k„B]°I÷Yv\ï\ã¼?8\Õ1ÈÊ£³•n®gk›„÷3‘íŒ€I,z\àœL\ï]\ä¡T\ã~ó¯º\Z8¦\Ó}„`\áV\Í6©>FW\"ki°ºX÷²„§VC}\Æ ©\Ím[M¹\çP\Ù\âr#(O@{Àød¸>\ÖÉº{›»»\Èô•£H\Î\ìbR ;d3Á\Û`>5\ÇŠÑ¹–“¼±“¨}²af\í1¥½GQ‘¸—S¢‰\Ê;K¼\ÓN¥Áô\ËtL$@UŒi\0,t\ÅQ9Ó·xš\ÖV9„l\çe*\Ëˆ\Ïti$“öA\'Æ¬\Òp\Î.°}%m\íŒ}Ÿmª)A]:õi\ê\Ç\à¥\\9S‡_ZÛ“Ñ®ûfíŒ‚I!\í…ÁV\ê@P \èÀ‡K¥•S\ê›\Ï÷ş7\ß#\ÓH\Í\Ä\Ê\ÛğûKur#‡[)\È*€G£:Œy¨*$\r\ÉÀñ\'\ÃÖ¶¸÷\nh‡\Ò\"´1\êe¤/µ½¦³\ì\Ø	|\0W:ºX.k·¹\ìd·[y„\ÒF\ÚANîœª¹\ÖgÑ±\ï}¡\æ*š\Úm¾\å…ğ\íô\ï-¦¶º\ë{\îO\Ûñ\Û_\Üg¸ƒ.\ÒÉ ‚¤3¸aõ@~¨Ğ¾e\ÆX\Õó”¸Iµ³‚\Ü\à² \ÖG‹ôóvcó®Q\ì\åmc{{k™b\ÕL\Úd¡\æw=\âHÓ¥0¸9\Ã0B7R+·\nö!Ç#Î“o‘JRº¥()JJR€R”  9çŒ½¥”²\Æ3)\ÂD6ü\ã*w\ÛG\ÑMq˜¢¹‚\Ö?£¯vV\Â\Ê\Ñ\É,·Nw–dF¢€o­º÷\0:«¶s.\Åx\Ğ	û\ÑD\æC„¤¢†óPò¾9\0\íe\Â!\åòò 8­´<P()\Ãn¤\Ûv•á‰®Œ\à|1_Œ4l\î\Ş{Rv\r2b2|„ƒ»ø\â»ms\Ïl<rD…, \Ïmw©X…\Öcˆc´lyœ…n¬r1‘9d`¥ñ^o´û=M$Ÿr%\ÖAò\Î\Ã>™\ÍGş_Û†\Ó$7øH6Y·ø?\0 Dú”\Æ\á\íd\ë»\È:~ªc\rŠ™´³0Dh\Î¼|I=Xúœš¶\älW\æ\ã&\æ\Ò ‹ig‘ƒ°ªd\Ğø²]I\Ã \×Y\á\\2{ˆc–\â\îs\ÚFŒc„¬¤€HSø\ãó†¸ÿ\00pqlMå²§x†\Ë*	`:+.5|³ç\ìßŒ—nÌ¶Q\â\\vhFŞ‡®\İ{­\åµY(\Öö¯Ácƒ†½\Äõ\Ö\í¤L\Ï\ï\Û-)b\ÃK“¾zgÂ¸—\ç\ëû{\È\î\ŞW˜ *Q\Ø\á£b ğ\\\à±U88¯Óœ\ã\ÃMÍ\Ì\0e¤†E_\Ö\Òtÿ\0{\Ç8u•¤©X\"\ĞÊ§\Z\ÅCyuŞ¹YgA·I¤z–\ÒxÁ\Ö8=pÛ¨„±\ÜÄ»e’GTtôec‘\ã¿C‰¨eö¹\Ã-\ÙbnÙ™”3\Ä5¤JN’6rúF\ïÇ¯}Ÿ†y;9tŒŠ\ÊXo\él\çb:\à\ìGZªp~	5\Å\ÒY Ä¯\'gºH8bq\à }«Fq—+´\ÖSó£õ2ûB\áD\Ò\Ê\ÇH•\äúhE-û*³\Í|V\î\ì›wGµ¶e\èHN¤°\ÒúN!C¤\åA,F\ÇH$¯\r°µ\á¶b4\Zb…78\Éc\â\Øó1ğñ\'Â¹„œV\â\êI\Ş\à³\Í#Al\ìŒ\ã:\ÙP(*H\'lšº83y\0\0\0\00\0\Ø\06\0\nˆ\æDŒ®Ñ®\ÄÃ¸>#´\Î<¯\Ãl\åš8\åyµ:«\èF1*dgH	†8\Î7\'¥y¼\á’FL‘ê˜´ˆ\îŒ\Ê		Ù•Á”\Ä\0\Ï]g$\à\ZÁ?h\Ó&\ëO}Ñª:;V&u.ahğDR„o\Z5VP@\é¶Æ¸‡%ó\Å\×\rP—V\í%»Uñ¥Ôû¬FºIõxõ.D\æHd…£ù¢HfT-\Ş\êc,F>îµS\æ>m%¥\ÈUVf1jî¬‘\êÔšNw*0¤W=5hOm\ÑÒªcdœz°ñ·‹ÿ\0&\Õß¶®\Ã@·¸*ı\×\Ö#\0)Ù[¶\Ùó©\ÎVº\àñ‰m§Š0\ÊUZYœ6%·l®\àd\03œ\àW.\åg¿L¿u\Z¾…w¤\ß\è{o´s±# \îFzŸ2s´(,  \0¡JD½;4T\ÎÇ¡li#9$¬\Ú\ãí“ŠŒœ°Èh\âV÷w´EŠD%\Õ6J«—\n¢4o´6\ÔHÛº£sœO{2g·™ò¬P\ÎñC\î°	P]NB»:ƒ¸q\áT¹¥¸\Æ6ğ¼°\Æ\ä03i’DŒFR/{®Xü\ru\Û>^\Ş5ÑŒ\nƒ\n›¼gõ•‰Ü•*\Ìw-TÑ¹M»ğ\Âyô\Ëj‚P^y\à\Ùw\n;·%ÿ\0v4où}zY.W\ŞH\Üx”b¤üß¬º¯\×1\è¥L¼\ÛT[CHû\æ¥#pÀAd¸#ÀŠ\Üe5\Òı:0hÏ“Œ†¯tŸ5µB+\Ê \0\0<…ê”¥\0¥)@)JP\nR”9õ\ã€|\ÎøõÇr^\'n\'y.Kû+uf9\'³H|†ZP0\0F\ŞU×«“\ÊÁ¥Tó\î=$t±G\áRˆb”¥\\©ğŠ£p3\'¸xˆ\ÌV³+FÀû‚MDFù>\ë£:†\'\n\ì	\Û½Ujú5^#`\n\\Á$EH\Èb‡^ş}ÓŠ†J;w\â‘Í¤£Ye‡\ÛC\ÇÀ‘Ÿ-K\ç\\·š8,–2I‚l¥%\ÕÀ$[¹$º>=\Ô$’ \Ø\Z…#‰X\"‹\Ãö‘\Âşô$’]Pç¾„ø\äw€a\ÒùW\Ú\â„v÷\Ã\Û\Ît0>:ucXøo W9Ã©a\è¾T\ÍN\'?úNÑ¤@˜Î¬Œ|¼ş­mû?\à©f.¸\íòöAƒ˜Q\ÆQ¼GP\Ï\İP:\î~ğ«¯Nd\ßI•,¢q–-dõÊ…\Z‹|j­\ÄxÔœA\ÖWŒ\Çn‡0D\ã¼\Íúw¨Uğ\É=H\Å*«¤Ó­\×\ËP’k	\Z|\Õs\Å@B\Ò[Z&\êv[†\Æ\Ò0ı\í\Ü!\Üõ8\Û8Ÿ4¸]\×\rx\âQ¬&%\ì\ãš9$X˜…\É\Ò\ãY\Ô2sœô©J£ûG\Ú\Øùö§ğ\ÌYÿ\0¥u’\ÂÉnËŠ¨\0\Ğl>[V¯»\ì£g©¶¿}Ø…Eù±¶\ÍDñ”Vİ§\æ¡\í®¤;œ“¸p:÷\Ø~¾CO_¼µ\'\ë´ú§\Ñ[hŸµ\ä\Ø\Zş€\Ü:æ$,À‰;\êA`u0\ÒF§\0`V\Ê£Íºº]Â½\Ó$\Ğ;\è\Æ\ØgVpGN\ê\çlœÖ·\æ$ú¬4`\Ì\ÆuL\àÀ\é…N\ã®ÿ\0|n+¼\È~­@\î,\ÜO\r\Øm\ÓO_@+Ó¦u\ï\Ï\ÙzıŒJˆ\Ïn=zñ>]\İ\İÍ¨	3	P\09…[$$qî‘¶\Û31># \Z\Å©gh€ûQ¹Añ*ˆ@\';\à\ê;øÔõ\É\\\"`\ÈùH÷œ\ã\ì®wó$\å…-l7Æ§#\r#`³|O€ş(À\0VI\ê§/ŠO±/_\ï¸\Ñ\Z\"¾£I-\æš\ËD„‰^3¹!º£:”Ÿ#š\ì<¯\ÅEÕ½\Ï\écF#Éˆ\ï“d|«™G\Z®\Ê\0p6«?±ûœ\ÚO„w1¯À°”\Ì5»\ÙvõJiqœ™u\ĞÂ‹úª<,!-\ì‰9*ccÔ’™\0’u.’N3œb¤i^Á\ç\Z\Ğ\\’tº\èo,\ä\Õ>?€;t³Z·<B I,h|º©ı¦¶A >Ò” ¥()JJV;‰\Ñ\Ø*(,\Ì\Ç@$“\Ğ@@ó\ß6v¬Éƒ<„Eù\È\Û)ø.\ì}¨:\ÔE\Z\Æ	:r2w\'rr|\É\ëó­F\â­Ä®\Úø\ä[Åª;5#$œƒĞ±ƒ2Hñ8Ï¯€ùÿ\0Y\"¬\ÉJV9\çDR\ÎÊª:³ |\Î\Õb•^\ç4+W \à\ÛÊN5w	\Ğ\ãØ‚w\èÆ¤\á\ã6®p·±ò!?\ãYo{&‰Ä…{6VI\0i#s°\ÛÆ w¶mŠ¥Ìˆ\êY€t¨e:@\Ã)_{9\ÆL_³µ¸\ÌrÆ²\È\ÜÄ¨q\Ğ\ã€s‚\r9u8¶·‚\ÜKr\È×²¤CÄ½’\ä%J±\'mKŠ±Á\ìª³__HWp¡6ùeP§I:›\Ç\í:Œ–Á\Î8.[Giú˜L®Ä“­\Ëh\\\äœc†1Wj\És\ìº\â\İ\ÌöWm3i\n\Ñ\ŞZ\Ô\àH #|wH\ÉŞµl\í¯\çg`’Ç ¸F#\'$lº™ÁÁÃ¤ø‚4CFj®qn\×K\Ä\'\"\ÆÑ‘ûæ´¸ƒ\éaOëšš¼\à\Üz©­-\îuò°`<ñ \Z¾\0f§ıK\ÖWû\ã\Ü\\ˆŸgB\ÌUQÁ\Ü}Z¨òØFòJD`wõ©\Â\"Y8¡GP\ÉôÊ°\ÈmS*° õ\Û[1\Úv9ƒV®È˜µg9\Ğt‚}H\0ŸRk\ç\n]<B\'ı$3Eü\à\Ñ\ÊôRCü\Ó_+§»¾QóG»k\ë­?#Vß•¯#ŠKdX\Ô1“B	N—#Imj¤g\Ğ\ÓjÇ‚ß…X»+x‚€º„\ê1¶U)?\Ëñ«¥+Tºe\Ê\\ç·Ÿ\Ü\â“\\2™sÀ. f’1ôX×º¤£‚t2’*FO¼I5ùCj	W“²q±YƒDA\è}ğ3¾\Ûfº-W9\Ä\Ú\ãR6Š@!NÊ²o\àvS\å\İ;ws²¸Ov·ğØ¼e(\ì\Ş%Oˆseª\0#q<¬@H\â\ï—c°Ü¹¾@\×Oöa\Ëò\Ù\Ùiœ<\Ò<ó¸W|w~J\\\Õ\ØC¥“²M,0À*€G‘À©\ÎT\çUµ-k0ª^\Şyò Àh›Å¤\\ŒË‚<AÎŸfYN\\bš~=¦}l,Â”¸:UR8\Ç2Ks/\Ñ,7\':\æ\0\0p\ÚO‚ƒ±q¹=\Ô\ß,\\Á\Ì÷¥`‰\"\éH³¢[£\×\rú±»º}\ì\ë^¹W€-¤Zr\ZVÁ‘ÀÀ$QöQFÊ¾s’I>šŸ¼xÿ\0…ùşø\Ä\ãÒ²ù1ğ>U··\Z˜	e\êdp	Ï‰Q\Ñ?\Äø–;\Ôõ)]RKdQ¼ŠR•$\nR””¥\0®5\Ï<\Ê\ÜRv°¶b,\âaô™”şy†ı’‘\×\Ç\è¬üù\Îr\ßHü7‡>#\\Ü€t1¡s¸\È\ë¸d\Ö.Ã¢·‰b‰p«ø“\â\ÇÌš”ˆlØ†%E\n P\0 `+õ°’6Œœj\ÕOUa\ê¬P+=*\åM	~fˆ3\0$R\É\"³\"œ0ø£Ñ…eöy\Ëğñ+‹›Ë¥\Ço+A-º ‘”\ì\Ä\ê|\Ï\\C\Æ\æ\âpD7YPwÁš%]XğVÕ\nšöiÅ–Ëˆ\\XJt¥\Ûöö\ìvÏ¿|úúŸ\ÆVY\"\ã•8sŒ=•³\Ó0Ç·Ã»µGG\ì\çƒ+\ë0\çÈ®Wú$\éı•i¥T“\Ê \0\0\0`À*õZ÷÷±CK+ªFƒ,\Ìp\0¨\Ş\r\Å\'¹Ä«en}\Ã(=¤£~ğA\ÉN\Ä%ˆ;ªø5Z\×jÌ²\r¤\\€Ã®“H|\Ô\àm\æ\ê­šP\n\ç¾\Ò8d\ÖÚ¸µ‰\ì\çD)q…$‡¡r¹=˜%Á\È\0WB¯.€‚ˆ;‚<¨5Ã•I¡‹)\Zƒ’ú»\Å\Éñ,Ib|É¯Wo\\»mZo³†s\Ó5ó‹ò\ìœ6G=œ’Z\0\Æ^V@\Ä3B\àW\Z@FÀ\\¨\æ´xÍ¤\Ş+•q=\âJŒ\ĞÆ¯(¶cx@>¢Ç©S\àşº\Çsyx\ç=\ìõ\æCİ­¾„——\é0\Å\æmm‰\"%Lx$Ë5.’rpsŒdŒ]j³Àø§eCiy\Ü\î\å,®0\àl¯ù±“Œg\Ô7†*O†ñûiİ£G\"Uİ¢ux\äQ¶ú$±¸\Üo]%T\â·OÌ¬gù^D¥xš%u(À2°*Àô Œ~#jõF8\Ü\ì<Ï‡­s:”¨F$”gBOV\Ò\ÅCV\07óª+›b?G2®\Ò@D\È|Šn~Eu\n’´›´\r/„¯$‹\ÔwY‰Lƒ¸:4’<É­Ng-¥Á?¢~*T~\Ò+~O\Ãÿ\0¯\É\Ù\ïNı\Åÿ\0\Ù\Ï\0T…/de–\â\â4m`wc€uŠ0z.\à“Õˆ\É\è1r¨nK¶h¸}œn0\Éo°ò!#ñ©šú¨\ÅEapxM¶ò\Å)J’)JJV\Z\ãö´÷,q¯V?\à\0İ‰ğs@nI\"¨,\Ä\0$“€\0\êIğ\Çy·œg\ânÖ–c´Y\î€ \Ë\ç~g\Ç\Ğ{ø8\ï»\â\äm`\"\é’\ã\ÈÉu<Bü÷Ù†ı¼Š*¨ÀP0\0«$CfÃ¢·ŒE\éQø“\â\Äø“\ç[t¥X¨­y\ÙÙ’±\ÚÉ9½+s\Ó\í«ö«\í\Ì\äiTRò9\Â \ê\Ç\ÇõTu,v\ä\r—ø7`¥ƒ\Ï&6t÷Qrp:œ’w&¡°Aó\ß\Ãq\ïZh2Ä’Lygf?h•.\ÇÍD^\ØÁ}\Î,‘²œ2\æ=+¤2# ‚ób+˜rš„ölN«Y1¥	-|Á?!P‰$¬9\ã‹pøÈº/`Aù\à\â)UG\ß\rç§¯™$Ô·ûUDß…\ÎÅ€ \Ê\é\à\îNsU\Şbµ\í»O¸ó)xEy4ŸBQELS$}üwWÍ¯ˆ:²Œè·=Œy\ÛQ\Îò¸\'a“µĞ½q^\Ş\Æ \Ç\ëa„\Ã\ÄIt“úÀŒ*›Zq)¸}Á½‰L¸Qu\nõe_vdş:ˆ\èG—Ph&vzV—\â\Ğ]B³\ÛÈ²F\ã!—ü\êñq[µR\Æ‹•N¹şj³ÁA5Q\ãmÿ\0\æmn	ış\Ø\Ë,‰ş5t¯„gc@R\ì\ì¯\î\\m>ô6\Ö\Ì>%…g<¿\Å\Æ\ë\Æ	ô’\ÎÜ\îi?¶£y\ë•c‚)x•†-® V”˜Æ”™W.\é\"\ëdsŒ\çÕ·–¸°»µ‚\ä\r=¬jøë¤‘ºú\à\ä|¨\n­ÿ\01ñNõ—ğ\Åqk\Z\â\Ô2¼@\àjx˜œŒø©\Û\ã€rûH²Š{\İY{kd6ó.ùP5•\È÷‘\Ó#EY9¡\â[;“6;!ºó\ÓN“‘\ëğ®;\Ë\ÜNyø=µVX\Èn\ÚFØ¼}£²Bƒ®\n\é\Ë\0»\äã¶B¸õM\ì^”åˆ–˜y¥C!$€a\Û8\ë™ñò­)w-À(À$\'\Ş@K4£\î±À\n¾h\ÏB\Ø%Lu”£¼ƒ\İVºO}‡¡n\ïÿ\0«>5½_5n¢Qx[\Ô*RYb´sõ\Ü6 f<¬\×>B$9T>®Àzf²_İ”\n¨†Id:\"‰z\Èş^€u-\Ğ\0Mt.D\å¡B\ÆB\æb\âAÑ›Á;\è@p£\âv\Íiöf•\Ê^ö\\.<ÿ\0Á\Ã[Lz,³R”¯ <‘JR€R”  d\åH–2\Şd’v½¼\ä¸Ò´oığùÊ™…Ä¥P\Éwt\åÛ®©“°\é\åV\ÊP_ö}aü§û]\ßú´ÿ\0g\Ö\Êµ\İ«VªP_ö}aü§û]\×ú´ÿ\0g\Ö\Êµ\İ«VªPX½Ÿ\Ø+_¤«¤°»»Œ\ç\ç\ßŸò.\×ô—Ÿ\Ûo?Õ«(\n\ç\ä]¯\é/?¶\Ş«\\÷šx2XqH™˜¯\"(L’I)\íc\Üò1mĞ…>u\Ùj£\íG—\Ş\îÅ»!õğ2\Ï:\ëL#\Ï+¨\æG•Se\È\ä~5\ê´8K˜d\è\Ãq÷[\í/\Èş\Ì\Zß®…)Q¼o‹¥ºŒ‚ò9\ÓK»J\ç` \rú‘¿¯™\0óƒğk¡zß¹sy;&–el˜$:•cWO²_\ë;Àd>y«Z{Bš×»\Åle¶\Æİ¼@\Íõ\Ê\ä¦|s\çS\Ïùu\í -9\æv\í\'# 8\Â\Æ?Š‹\İ3\ãVr+™r…sw¹\Çcw“¾‘\"†ù©\ÃÂ¥$ºFK¨e€\Äy#…\ÎI–\ÊOVª±ø•Á5G\æÿ\0e–q˜§³²¨\\Mv%¥×´|…Ow#!\Ï\\\n‰<,’–Y›\ÚO>C,ğû3Ì¥£\ïGœ³\r‰# ¿\0vxW8\Ågk\r­½¥\Ôİ”jˆ%b\ä—|Œœ‡­T9]Q­\ÒU\n÷´ \n‰¿¸\à:99\ÏA€&«Æ¿Ú²„\Üc·y\èÕ¡RŠm‘ü\Ãs\Ä8™	v\É¨!¾/À‘ö\Îûm\è±q9\È\Ñku\Ü``~j5ÀgôÀÂ¯ñˆò5 \Ów\ÄH­$­\îÄƒ.Ş¸\è£Í‰\n<MhI\Ã\'¶\â.t‡š\Ú-9+…\Ïic\ïb	\éœ\ç\0Vw+\ïN\ë\Ñ[wg\Ö\çdª©ª\â÷|’B¨ªŠ0ª¨ò\0`\nÈˆ\ìÁ#Bò7º‹\ã\æI\èª22\Ça‘\â@?+\âBY$•	\ÆJI\"\ç\ÆB2zXj\èsÍ™ÇªÎ¥@µğ^B·o-Ä¿I*T´,QI³@Tœl2\Çv;œl\Ï\ä\éşwıhÿ\0-Rm¹¾ú\Üv…ş—\ï2°A&¤\Æñ€­’\Õ÷…t»Äš$š3©$Uu>jÀ0?¯©\Ó\Û]ı>ğxV\Âq—\ÆE~NŸ\áwÖò\Óòtÿ\0»ş´–§)]\ÎD\ä\éşwıhÿ\0-?\'Oğ»¿\ëGùjr”\ä\éşwıhÿ\0-f‡‚iúM\Éıiÿ\0ù©jP\nR””¥\0¥)@)JP\nR”%\çG½¶¸’÷†(’9N©\íN\İ\ï\ã¹\ÇPzj´œ\Ü\Ãil/\ÇUƒó\Òe)S’0{ƒŠq;¶\ì\ì¸t Ÿ\ßgRˆ¾y\Îû\Äú\Z\è‹\ìñm_\éwr}&ôŒk>\äC\Åc\êF¬\rº“•)’K\å)J€)JPN\'\ì\ÂÙ¥y­§šÑœ–uˆ©˜õm\á\é_-½š.İµõÔƒ\ÅT\Ç>„Æÿ\0ò•G\\\ËK>E”\ä–-œ\ÚÚ¦‹x–0}\â7g>l\Ç,\çÔ’k\Ï0p(/\"\ì¦\0†FS¥\ãa\ÑÑ¾\ËÛ¸9ŠùJ¹RËœB\ßcÒ£$‡H|y¼lFş¨N~\è\éQ-{ƒƒ\rÎ¯»ô[¬ü?7JWŸ?fQ7×‘®:\Ûb±É½À¹+ˆÌ’k\Ñk\Î\îóF­€F€4+1ù\Öp_q‘]K†Ø¤\Çc	*(\'8UFş;´¥l®¨Wò£<\ç)òlÒ”®…)JJR€ÿ\Ù'),(17,'root',NULL,'root@sunilos.com','2024-10-01 01:54:36.636000',0,NULL,'Profile picture',NULL,'download (8).jpeg','/User/profilePic/80',NULL,'image/jpeg',80,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1!%)+...383-7(-.+\n\n\n\r-% &---/----/--5+--++-----------+---------------------ÿÀ\0\0¿\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0C\0\0\0\0\0!1AQ\"2aq‘¡BRbr±Á\Ñğ‚²#3’¢\Â\áCSñ$4st³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0\0\0\0\0\0\0!1AQa\"2q‘¡±Áğ3B\Ñ\áñ#rÿ\Ú\0\0\0?\0÷P@X %\0@h€²\ç4\í`«ˆ{¸¬\'8Á^LõE\Ëc[5ô=\ÖM>ª$ñ\ÉyQ½a\ß|¿ı§úƒ\Íkÿ\06\\Œ¿\Ç\\Ï¼W°=&Ó¬\Zª\İbıJ\Æƒ\àlbxp¨ ¥*2RWF–šÑ—Y\0(\n $ µ@@H	@\0@¶û`¼\\t2´W®©.¦\Êtó³–W8\âq©4ùª%9M\ŞD\Õd|_+F®´\Ó\âwf±¹•—\íñõ\Ã#_¥\í\ÆVH¼¡ÿ\0pk\×ôóL\Ã+2,—³Z\ê¶FõŠ\äG\Şõ:Ò¦\îŒ\'O2³GMg¶±\à¼vTWÁ[Ó­	­°…*r\è\È[L\0€ \0€©(\0 \0€©(P@`^W¼PôİŸª3?\áh«‰…=ü°¥)\ìqw¦Ñ—\à\0\íÎƒp§Şª¢¥W992}:J*\Ç\'ymiÑ¥\Ò\ZÒ4h5\Ştk¹»£Nû#Y-®\ØñPC²1¯‚Ã½¦º’ñ>X­t\ÒZd\â\ß\ÓE\ä±	l‘\Ã.%g»\'¶iE=·SÂ©B\â‘\ä°Ë{=¢\Ò\ÑPü]OU+\Şò7\Ô\Å\áô\Ğ\Ø]{IW`x1\ÉZR¹u\ßğ¶8qZ¢3‹Ù£®»\ïù\ÙL28pYS­R3L\è\Â[£«ºö™£e\Ç\Ñ?E>–5=\'¡xfµ¦ø8ŒJ\0€ ¢P\0@U\Å\0d5´;C‚±\Å\Ò\Ñ\ÎÖ‡€\âUv\'o=\äº4/\â‘\Â\Ûí”«œ\î²IUÚ²|bh[–¢+V\ÄNCBñJ\ÔğK\n•T4[’©Ñº»\Ø\ØÛ®¶CvnC\Ş€(\Ñrœ­Ì¤ı\Â\ÒÜ‚Ó©\ä§fk¦p‚F—7˜ó\ŞË¨KI\êÈğ³Œ\\Ó¶\èÉ»£>\Ñgn\êV‰¾&­\Ö6µ\Úd\ì»ÿ\0\ày,\ïtesY{\Ü\àó€\ê=‡O5¶•V´0”S\Üù]V\×FşBC\\ª\Âw·\ë\Zx)—N9‘p\Ë+<F»õû\Ñbjh\é¶^öpp‰\æ­wD\Ä\è+Àı\Üw‘\ìşLE$\Öe¹\×+R@EP€ \0€©(\0 5›Ao\ä¢$t\ê\â{¾aF\ÅU\î\á¦\ì\İF¥©\ç³\'ÆŸ~*˜²G5l‰Ö™›\0\è\n:_th\Îò)\ÙU\ä§\İ\Ç7}	†go\ßSwkn	b\r\Z8\ni®GÈ•œ3hNZÅ³ayµ¤Eˆ€­rÓŠŸÒ½£¤õ\ásM\ì™i\ï(˜q1õ\â0º‡\Él«\É\Ş/S\î­#ñ{&Œ\Ğ\æEEr\ÌfˆZ`\Ü&›FÈ­œ%€)§&¶ú\ÄõK™óµs£{A£°\âo¼\Îpø(´×‰&{\'mH±JÙ£¦÷4\ÇQe8:r³<½õF¢õ±ò2f{Ëœ<–\ê3\Ë;=™®´3/C>\êµTªô!I†>„¯\ÓL\é\Õ\Å/mm—\ê\Ğx€|B\èº¹TÕ™$¯OB\È\0€    !¶2“#[¹­¯y\'\è^:^4º°\Ë\Â\Ù\Ê\ÛF“óÿ\0%A&Dµ\Ãw`n\'tq;¿A\Ü\0óP\ëK4‰‘\Ò&<­®0}g~—-˜evHzS6×¤¶x/hx\é\0Àjy\ÄÖ²1R÷šÄ©Ğ£šWJ\ìRªŠñ=\rtûK(\İm\ïw\"Ú\ÄÇ\ÕR¿ÃŸ4EX\êkƒ3\î\ëL6¦	C\Út4\Ì\àƒ˜#Q¥fME(\æ‹\Ğ\Ê}‘­‹\Ë\æ4·¤ğ\Æ1\É#cn˜œ\à\ĞOõ\ìXº\noE©ë¨¢¼OCg\â³8“f9W\Ã\ÅF…Í®K\Êøv×‰XòH?#¹w˜Ì9¦¼¨ n¸¼)@¢V¥rDuW)gœ\ßU\ÄxŞd™h\ŞYˆµ£W[\É‡²Œn\ìi“¶§§4P\07dº¬Tô@€”\0@¶\r\"`w\nk¨\'*xxª¬l\Ù~„\ì3ğÔ­\Å@wšw}‚¡\ÊÑ‹d\Èj\ìm\Ø\İê´šstÿ\0­‹óŸ\é?U/\Ä\İ?!»¿,M\r6–ƒ\Ë5‰©ı\Ó$‘¢W°z/-4Ç¨^ö{‹Iq9ş\ÑRËp<\Â\ãt\Âğ•ğ\Ã,\"6\ê’\éJ±\ï \å\Z÷W#\\úUZ\ÂM\ÆKO‘S:Š)8»\ŞÇ¤\Üö\ËK˜)\Än\ê2\Õ\á\ç·Y^\åK‹i´^aŒşşô6·ˆ!®#PFM†§‘m=\ê\è]\Ëò IW6(\ÌaÇ“cğ’\æ\ÒiŒ\é\\CZ\n\\Ğ§\Zt¢\Ú\ßR“VU+I_mªÖ»(´±±\Åo„µÌ•‰Z\æµá²µ¹f\×a#ˆ¨ 4Y\âi\Æ)©mkšğ\Õ%)\'\r\ïc\í\Çh\ÇtŸ\È\Ğ\Ã\æÒ¹\\KñX\ê\éù¥¡£”yö‰Y\Óò\"\rM\Ù\Ò\ì]ˆ¾^Plc¿\Ğ|O‚°ÁR\Í<\Ü;G/3»[\å\0@A@@J\0€ \r\Ö\Øq\Äl­}\Ã\Òğ\È÷O4s.Œ<\í+>\'k üß¤ı<‚¨­\äe•\'\âFÉ½\nğ?CóUöğ\\—ú\ìs’óm8\Çô“ıªN‰¾^C²…\Õ\nzØ%fc\Ëba \à\Z£ÆœVÿ\0ò+eË™\Û\ÔĞ°ô3fÈ¯\è^\Ï[ ¦ÿ\0ò´j\İÙ½\Ú\ÖD\Ê\ÒFc#ğ^;¦–Æ×³Vi‰}\rF \×\0h@p4\Ğ)”±\Õi\ÅGF—4D¯¥RYµO£6+cm&¦¤šTœ…M4\0w…|UJ\Ï\Åğ2¡„§G\Êr¶,ıv‰Oõª¦\Äù\Ëxù“e²>Yp0U\Îq\ì\×2x\n)4i¹Z+r¶¬Ò»g¦\İW{a±·v§J¸\ê~ú•õ*jœr¢¢ss•Ùš¶\0@\0@ 9\Ö\å0\È%`¬Xª\î,®µöhNf«†\Ëw¾Dú5³h÷0¬¾›£>öš,*’+G\Ú{\ÆG/µ\ä\ÌSz’¶½8O“ŠÙ…ó\Ø\ß	\Ô\Ø\í\nÁg&[S[LF•\ŞtY\ÜÔ \Ùö ¯š+§±­u‘\åÀş\Ò\ê%¤ šR\ËmÕ¶2I”\Øó\Ìc\Û-­c\\÷kZ\\{\0©^$s9EG:GTû\Ò:§\â«\ç\ã©eÅ’¦\Ô#¯z\År2\Ì\ÓNs\İ\Óy\Ôõ©t´(F’²\Ü\æ*Ö•G©´[\ÍA\0@@H@J\0€  ”„  8›öB\Ğ\è;^Ã‘òı+š\ÆR\îkôeö}\íqG=µ¶,qH\Î-4\í\n,J‰’\àóD\Õ\ì•õ<ö\n$nr´jÆ¿1\ÖA(vD \æQ\Ä\Ì$´0\í·Nøe\äÇ¨\è\Û,^=¼2u:–õ]ş¤Ÿ©£¸¯Gc[=šs’\Æ\rz@Z@?\ç½g\ßÃŒQ\ë\Ã\Ûi\Ë\ï\Ûô2,·pg>YŸ+©@	s#mŠ§\ÅÄÅ¢sR\ÙX\ÛN.+WsM´vşQÍ³7yJnh5\ròõSŠ\Õ\'–-›b®Î¿an\êÉœ\Ø\Å1\Ğ|OpXvuò¶~\çÀ\Ú²\Ó\ËÅú\èJ € \n€@J\0€ @T $ [~\İ\Âx\ËtpÍ§¯‚‰‹\Ã*ğ·±\'ˆtg~N\î41<RFdA\Ş…s•\"ã¤·Eô\Z~(\ì\Ï3¾¬n‚rXKs\Ä\Â8º)ô*f€œl\î\åËµÙ†L\Ú\\h{Få±¥¹…\ï¡\ÛAy0{·¯‰ğš\×\Ï.Ü²\ë%NV÷Ú]\ÉÁ\Îqô\È\æ€w·\Ö\íÓµd\ÖUvxİ‘]”»,•\0¸¹\Ø[]IôœOÏ©C©š¤•8\îÍ®Q§\'±\í—=\Ş\Ø\"ŒÎ®<\\u?!\Ô¿\ÃPT)¨/oVs˜ŠÎ´Ü™š·šB\0P@X 	@V¨\0€”\0@!ª¿n\íµ,tdn£¨Hu(¸œ$+­t|ş÷$\áñS¢ô\Õr8-¢\Ù)\Ë 9Vmn]\"a›óÒ‡ªµ2\Â\Ï+¿+İ­m\×\Ó\ï\ÖŞ.U£¿ô¿O_¿O\Æş¿—{­‘\æŒÁ´·HôCI5\â[¼\ZN\Ã\áå™¹­>dlN.9R¦õù[m\Ş­>ª-\É÷\æk®í‹šÑw3M’‹9iiÏ˜\Ì]#­§&K\Äöù‘1˜\ÂY×‹\åü˜—¦Èº	\Ç8\É+†)^\Ñ\Ìk\ä&ŒnZ\Ğ×ˆP\n(\Ø\Ë\Â\É\êøı»	8\Í9-f\ìô½Œ\ÙÁf`s›G‘@=Fğ÷õ/„tÿ\0\Ù?3ø%v;Ş¼ò¯‰\Ó+¼ \n”€€”\0@A(@\0@J\0€ \0€ 5–\Ë\ê6T¹\äz R½¤…\âi©Y²Tp•%«m¿m\á\É2}^„\0\0\r\áLú•\äûÎ‡ú¦®Öšio^¼\ÊJ]³b?\İdõ\×Tı8\Ù\î¯ûÍ‘¼\ÓQ\Ä.N­\Z”e’¤Z}~õ:ú5\éÖzRMt2¬—ÿ\0ì‘†¹˜ÙˆÒ†ªM\È\çÙ®ªË²©\Ë7IpW¿\îUö¼\áB\n³\âÒ·?Cyv\Ş\ÖKKšöô\ÚHh{H!\Ä\nû8¨uªßŠ\Ã*5”j¯\ë\Û\Ë\İ\êE\ÃWu¨¹\Ò~Ÿ³Ÿ¿\Ğ\Ş/\0@\0@€­@ *@·”\Ø#qß \í+Ui\åƒf\ê\ÏQ#‘´[\Z\Â\Şhªn](\Üæ¯†Yô\ê=å •\Şö<Ü°T\ï\×\à\Ú>y\ÛQQ\ÇTK§\Éf$dŒ\ÚH<A ù+\n”\áQeœS]U\ÊúugMæ„š}_\"dqq«œI\ë$üW”\éS¤­N).Š\ß#ÚµªUw©\'\'Õ·ó6\r¤1\äJ”\í\ÍP~$‚\î\éÏŠm{\Õş‡GøbMÔ©O\Ü\íõ=>Á>65\Û\éŸh\ÕTÒx&ZV†I¸™l5d\0@€”\0@J¨\0€”¤\Úú,\á\Î?óPq“\Ú%\Ë\Øq‹$–™^\Ø\É”n›µÌ¦~gy±ÁÑ…J‰Tòñ7\ã1£Iº~n4Œ˜¿œMI\Í}\n•Ñ¦©ÁY-›W­*\ÕI»¶\î\Ë\Õfj@c\ËhÁ$gÛ§‘TˆU\èGş¾Œ\é?»b\'ÿ\0?Tz\ËÚª\Ò\Ş#ø’\æğr\Ş\'G†\ÒöÂ§Å€@J\0€ \"¨	@\0@A(\n„€@J\0€ 8»ò\ÙR÷\×-İƒ!\äª*\Ë<\Û/(C$36\ÅH];‡:gT\ãmCa8ù•†a\êWc*f©nG{Y9D\Ñnk\Îì»œ\ß\ép]¶\Z§yF2\éü3†\ÅS\î\ëJ=~z˜\Å\Ëyb@g]÷W\í\Úh*ø˜\Écã‰¥Ä\Ú\ÜCÁQö\ìsRŠ\êşEÿ\0\áù\ä­\'\Ñ|\Íş\Ê[i„×‡\Èù.>œ²M3³¯ğh\ïÀV\Å(\0€‚P \0€ *€€ K\Êl1¸õS\Ç%ª´²Á³uæ¨‘ç—«4¬³³##ƒkÀ‘\î=Ê²œsI\"\ærPƒ‘\éVxZÆµkZ\Z\ÑÀ@<¸J\Åm»³\Îÿ\0,\Øm,xÿ\0R1_y„‚||E\Ù½O\æs½­UR\æ¾_\Ù\Ë8«R¬©r\Ç\á”9Nş&6\àòPT]±+¸G\×\è]öD,§/Eóı\ÌXn\×Eh–1@Æ¼\á÷Hh\î\å\ÇÖ¦\Ñ\ÛÑjJLî®¹qD\Òwe\àh¬(K54\Ê|Dr\Ôh\Ë[!  ‚\0€ \0€ \0€©(\reş\êF T\\[´-Ô™‚W©~‡7³°c·b\İnw\æu<‹¼Œ$o+’ñ²µ+s;•bT\âD€\Ëwµq\ì{€ «\îÇ‹Pœº¯‡öPöÄ–x.\ão\Ø\ãdW%B>(dz\ál \Ã0\Ş%§À®{µÿ\02>ŸV_öW\å\Ë\×è½ \ÖY_\í‘ü¼ß’\ä\ë;\Ôl\ë\è«RŠ\èt\×lXbh\ßJÓ™ø«\Z1\ËŠªó\ÍQ³%m4•%\0d\0@€€P€ \0€Š 4›Hş€÷ÂŸ5öEyŸ¡‹±P_Z@Á\ØÁ_‹Ï‚\Ï	f8ùx”y#¦R\È“m»–´\Èñ›k\ë2všõ\Ö`\éwT#¾\ï\Û÷c“\ÆU\ïk\Ê^\Å\ìû¹¦‘\ÊQ\Æ¢E\éœQ\Ö~[¹!i¨\'‹\İQ\ÊW>\Ê.w·jFšƒ\ã¯\Ğ\è{”ª¹¥²·\Ô\é\à‹ƒ}gg\Şj~k“Š\Ï4¹³ª”²ÁµÁZ·)B´@Y\0@\0@@	@U(™\ÚIy\ç\ÙhùŸš­Å»Ô·B\ÛS¿6lv^6Xı _ü\ä¼y¦Ğ©¢*Yª\Ë\ïc\íZvi2-‰\î\r9ö\rT¼<c*±R\Úèƒˆ”£JN;\Ù\Øò (;—]{œŠV1fr\É#\Ó\â«\Ó4t7=±¬`\r8H-ÀŸ\âJş\'sGÜ¸~Û§Yb%9§m“³Ê—º\î\ß[\ÏaÎ‹\Ã\ÆÚ¾\í]fo‹k–\Ö\éc¬¸­†I˜\Ò\Ò\rHÖ€gGuÒ•\áPª¨&\ê\"\Ë”iI¢¶)\0€ ¤ $ %\0@I@\Z@A(.ò(^O¥_\r’¦©,òr/©C$TN’\à¶	`c€œ\Â€³›ò½ZQx&S\â)÷u\Z1¶\Çş\Â\×ÿ\0­7ÿ\07-ğó\"<¶g€S¢O\Ã\àU„d\ã³\"\Ê1—™\\ù>wõü\îú¬ûú«õ?yƒ\Ã\Ò¥{‘ò6·ÿ\0¸\ï\æ(ñ5_\ê~ğ°Ô—\é^\ã\Ğ?\á/´\Ú\îsDÅ˜ı\ãÁ\0×ª7(˜™9%™\ßÔ‘F*/Â­\èz½\î†,F(\Ã1\Zš}\ä:‚…\Zq•\çVs¶gs)«3Yd\0@%\0d\0@%\0dó´F\\\×4\Z\Ò\áQJ¬d®š2„²\É3…½!´\Ä\×c³¸Š\Z>3šji\Îh\íU\ÏR;¢\î\"”ö~óo°vyg\"F9„¿<\æ4ı÷ƒš›†‹Qi®%~:Q•D\â\ï§Õ›«\â\É\ÊY\æˆ\n—\Å#\0Ò¸˜E3\íR“³¹\ìx…Ÿc\íDf#i\Ş\ãQ\Ôp‚’\í*I\Ú\Ï\áû›—f\Õj÷_\ØÇ½vZ\Ón\àpkKhI¡½\Ë\Øv);j½±.Î«}¥ÿ\0c\Ç~ª\\u!KGf{‡\à\Å\Ø\è\ì’Lö–™¤\æ\ÔX\Ø\Ú4\ç»´V•İ°VG €´™—\0€ *J\0\È\0€ *J\0\È\0€   \0 %\Æ\Û†Y¶\ï3QñTõUª5Ô½¢óS‹\èk¯F\Ö°\ï\ÒV³tw9Û‚Á\Ê\È\Æ\0*\âi \Ş{†k8E\ÊJ+‰•Y¨E\Éğ=‚\Ã@h\0\0;\0 W	$¬m¶\İ\Ùõ^\0@A@@ 	@\n\0@Y\0@\0@)´áœŸY ÿ\0oö…Y‹ª_™q‚•\é[“şME¿øo÷OÀ¨Ä´g~]tœeŸ\Üï—ŠŸ„§ú\ÊşĞ«µ5\ê\Î\ÑM+\0€ \0€ (\n .€ T\nÁ(\0€\çv®•Œ\ï\çx\Z}m´\æYv}ü\\—ŒWsGk²\r+»\"Á\ÉEf|\Ş\ÅflQ¶6\è\Ğ\0úöU\Ì\"£‘ARnrr|Oº\ÈÀ \n’€°@\0@\n\0@h6ª\Òc19®!\Üğ\0“¨K\ËNN\0\nk‡hw\Ğ\0@P ,P 8\Ë\Ş\Ñ\ÊN\î\0\á\Ë\ã_QˆjŒ¼\ÃC%%\ï÷“`ş,~û~+\Ê?™S\Úÿ\0—/C³W@%\0d\0@A(	\0@\æ\×I„\ÄqR‚CNQ±\â¦m8ó\Ôm«@I@Q`€ %ñ´K…wª\Ò|V3–X¶eæ’3‰üÿ\0HtV\ĞÍ…\Ô{4ù…œ4’õ5\Í^\rtgp®| *J\0\È\0€‚P@X %\0@s»\\\â9	\ÕÂ\ÍmE \â\ÔQ¦µ¼i\Òh@T $ 	@@\rN\Ò\Ú\ÚØŒx†7Rƒ~\ZŠ\Í\Ê6*V¦\×2f\n›u­¢8\ë4ns‰&7»	\rgÈª\Õ\Ókq)%dø™ñt›\ï7\â>da?+ôgt®\Îx©(\0 	@B@@J\0€ 4\ÛCfÀ9ù‹BV¹„´º7WJ\á·cª¡\Zx@Y\0@€­#¨	\à	ğ@y‹-\Ê÷ZÀ\\ø%i!™5\Å\Ì,.Ê€?z\ÑF«MÔ‰Ò·BŠTSÑ¥8»_ufµ\×-ş\Â\î|–H\Ü[‚V8\0\Z\âjÖ—FKô\â\ËzÁP\É.h‹R¥:”\ã8§tõ»\\\ìôß–¼½ŒUñû\ìıAA§\ç^¨\ÛWHK\Ñü\å]ù@J\0€  ”P(\0€ 9\í¯o22Iş ©\rÍ®Ì\ÒÓ£\é[\é :€ \0€‚ş\"\\\ïlX£»\Æ\à5\Ò3\âÃ±a5¡w\Øu\áE¦õj\Ë\ß{{~÷9Ë¢úk#k_±š±\Í\Ë\Õ#tİºkO™u‹\ì\ÙT©)Óµ¥ºzk\Í;?oú³§»\íq‰\"‘­%\ì \0s\"™«\éA\çZq+kR¨\éÍ¨·£\àw\Ê\Ü\ç\0€ !\0(\0€ k a>I\ZZ?t$%\ï\ÚWM\"† \Ó#D@@J\0€ \nMsK\\*¡\çw\î\Ãa.’@.\ÂhZ\0Ì‚\r(;+\Ô·Mp/°İ»V%U›®\Ïùû\Ô\×\Ã{Bö\ŞH=>}*1sr¡C¢\Æ\é-	\ìüDdôÌŸ¦5\å\Ío\Ğ\ï¶júxğ¶@\ç°\0\á˜$hŸ\İV\Å$\Ê\\^\n®ø\ãdö7+\"@\0@€€€²›\Û7\ĞEÏs\ëF·˜h\×\\\ì\'	\Z\ê(*\à	j¤	@@@Y\0@I@cÛ¬ü¤Og¬\Ò8fFHz\Ñ\ä\Ü\"\É\Í,¦€@\çe\ï‡a=¡k\îÎ—ÿ\0Ee¥=\ëø:]”\Ù\ç6h\ís\ÃA9—3œ\Ò\ÒKZIß¡\Şê…µ!\â»fxšN” ¬ıt=fRJ¨ \0€‚Pt­¾n³>Ş–†¸;\rcˆsH.¥Q„G‘\È\å@6H%\0 ,\0@T”\0|m:´\Ğ\nYF°\0€’€ªÀ %\0@%\0 ÿ\Ù'),(18,'root',NULL,'root@sunilos.com','2024-10-08 18:32:05.885000',0,NULL,'Profile picture',NULL,'images (5).jpeg','/User/profilePic/77',NULL,'image/jpeg',77,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1!%++...\Z383,7)-.+\n\n\n\r\Z.\" \"--/-..--+-------/--------------------------+---+--ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\0\0\0\0\0!1A\"Qaq‘2Br¡#Rb’±Á\Â\Ñ3C‚¢²\Ò\áDsğ4STc„\Ãÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\03\0\0\0\0\0\0!1AQ‘Á\"2Baq¡±\ÑğR#\áñÿ\Ú\0\0\0?\0\î \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÉI%vì–­½\É\Û\å\ìú\r\Æy->E,—÷\ä\Òk¶7$ŒV•Lœn:ô¬®7\Ê\ïõXZQ\êô³”üz9|‰#¼ª\Û\Ô-¿³P\ç[h\'w3\\W£¨¾9\Ìü\Zµş¿\'´6<•\ç\"†.j•hz\Z’iA¹^”\ä÷%-2·\Ôü\îGlSVğñ•¼\êzKrD¸\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0s.yv\Ü\á\ZxHI¥R2©Z\ÏYA<±sjM÷\"l5\ßW?\Ë5ˆ¤yrrÃ’·ÀòsZ*qŒTe¬\\¦•\×]·ßˆ¥gR\é\àô\'5\"õˆ\Ôû\Êwøj•%|F*\ÓÕ†²ğ¾¯Èú‹[\îUoş#(\ß–#ò÷\è\ÎÂ“”²\Å96ôQ‹»ğE™F\åÄ­-kr\Ò6şƒ\äF6µ\\?Oú\è,•.\îİ½Y>\×_¶\å9š\Ì\Ï+\ÑW\\tˆ\Ë\Z/\Ì2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’v\Õø¶	)qü¬À\Ñõ±ı\İ~+O‰´VeRün\Zô\æ\ß\é\Õ\Êùyˆÿ\0‰\â£[œ ¨Â‹m\ÅZqœ\äø\î´\âI\\•\Ç\Z²/\ésñ\Óñ0\Òf#¦\çQõS\Ó\ä-\ïT\ã\ïOúS\Åco_Bâ§¾£÷O§ÉŠ\ÑQŒñ™b\ä£C;Ş¶J\éuğ!·Oú¯\âô>#ZœºˆñXay!†²sŸ½+/\á³øš[Š¼öèµ‹Ğ¸jõ¼Í¿T\Ü&\n¦\Ù#JQm)\Æ•9$ß­{¼\Ö\êz•­k\Ì\îgn\Ö,6:\ëyZ\îJW\ËUÇ„ ş´]\×ÁÈ—õÒ‡¨St‹{5¤\î@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09÷:TöŒ\Ôc‡¥RTm\Óô+4³_ŒV¯…´|x’\ã\åò\æñ\Øò\Şz}ß¯\æ\årØ¸\Æõ\Â\ânøÊ…E‰ù\ëTk\ÃeÕŸ“M±v^#NÕ©Ji¹\Ã=¯$”SÓ‡\r\å.bmeÿ\0\çij`½-\Z\ëı\á¨+:ª-¨§‡©‡rUj©\×TÒ­O2¶nŒVg«\ÕğL×—]\Ûüh˜\Õb#\İsZ¼a–şÔ”#§´\Ók\ì33¦µ¬\Îô€\ÂWxÊ’”\ïBT¡’\Ö3V½—iß\×Q˜\Ê;Û–6\Ñ\ì\êjzM=ò\ËgÚšû\É+\Z´*\ç´\ß\r¢[ÃŠ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ç”Øº¹ªT\Í’U3*ŠM*p¾Š\ÏMİ¥L“;™zN\"•®»û{Ê¢[R›ŠU\ã*rK2ƒNZ5w(¸­\Úk\ÕmHù½\Ö\ãÅ·ª\ÏY]\'®WgÚ¸3x”k:\é\å;^.6Oû\ÚcJø\é1*m¥^‹ƒS–šk\êI\İ4ø4\ìÈ­­u]\ÅKón!á³¶¤ò\İ\êÔ¤£;e\ÏºYx\\Ve¾L\Ú\ßc\ã\åSII~\Ò·}÷VwhS\â°\Å0\Úc\Ù\ÑKO6\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;WaS®Ü“\Ë\'½\Úñ—z4µ\"\Ëx8»b\é\ŞûilÊ™±	\åsy¨S³\Ò4·7\Ş\Ûm÷$Tµg«\Ğa\ÏY­&;wŸ\Õ\ï:VHñ\Şû:Ù’-¹\æ”u6º1ª\×rWW\îº1)ñ\Îú\Ì\"Ó©R-Fi4÷N	\Úÿ\0I=\İ\æ:ùK1\Z\Ü$h¾\ä^\Ï¥m)\ÆRoµ¬©|[ğ%\Å³\êy9pòù—C,¼\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ybªä„¥kåŒ¥n»+˜Ú•\æ´G»Ÿ6Ş¯{Õ¾Ò£\ÒDDF¡ùk«\Ì2ƒˆ”bœc«~´ó	\én²ˆa2FR¼²Óƒ“\ãÔ»[\à¢³=‘f\ÍLU\İ\çN°vLp´²§y=jK®]ˆµJò\Ã\Ìñ\\L\ç¿4öğ²6V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ\'*iC	V:5N¦kOL´\äš\èËŠNú=\Ü\n¹\"+.÷{g¤Ç˜şQ\rVUc•\ê\ŞN++«6º+Lği\è\ÒÕ­Ï¼\Ò\Ñ\åcIû|/9/±(Jº\Î\ç4¡\'Î£poMë\ï%\ÇX\ßU?Š\Ë\\_g§_\rõ\Z0‚\Ë\Æ+‚ŠIy\"ÖœZm;´\í\è\Z€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;Gk\á°öô\Õ\é\Â\í$¥%™·º\Ë{13—™>\åfXYmš8ªv£<\ÉÚ…ò\ÉtªI\'l\Ép\Öı…lÖ‰\ì\îzw\r“\ï$k\Ï\É\ç¤’[’I.\Äjšgh[n_!5\Æqôq÷ª<‹ùm\Ù.ÿ\0\É\í\×\ä±\Â\ãÿ\0Ej®\\\Ê	ôok«e\ß\âoYå«e\Ãñ\ã“z\Ú~œŒ4\ç(Êh(\ä\étd®\Ómhï¢·™7Å…zFo\Ã1-\Î\åÒ§^Ot%x\Í÷FVoÀ\Ş/\ÙO/›[\Öuü-M•€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡µ¶,-\'V£´V‰/ZR{£Å˜™ˆ\Ê\\8ošñJGW3\Û\\²\ÅbP“¥O„i¾›_J{ü­\âW¶I\ÏI\ÃúfQ»}©üû|™|M<\é\ë«jJ\\s\'tûu#‰\ê¿5\é¨Zrj‹©\')Å§M\Æ\Êı6«®\Êı\×313drùiB¢Ÿ”xµIR“’Ò®e~“Œ]·u6Ÿ‘‰‰”\Øf:\Äû(±{Vµ}v\ë’\ËÛ—|¼L\ë\İ=+÷#÷—\nJ\n\Ûõm·½\É\ïl\Ä\Î\ÓV5Fa–³’œ°©BJy9\ÒvJR\Öt»o½Ç³‡¢jd\×Irx\ïM®H\ç\Å\Z··¿ş\İ:M&ši¤\Ó[š|K71®’ı\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0“r\ëk¼F%Á?“¢\Ü\"¸9ûróV\î]¥l–\Ü\é\ê}3†øX¹§½¿·†p‰\Ñ\0\Ô\ìš)Eq}\'\Şÿ\0µ”2ÛšÉ?\Ê\Z·œcóc?\É#¹\Ã\×\ì\íTa`\0J¶”cm%›^Ô¯ö\\Îº13©ˆt^n6\ãi\áfõŠr \ß\Í^´<7®\Ëõâ·‡Õ¸^Yø\Õó\ßõ÷nÉœ@\0\0\0\0\0\0\0\0\0\0\0\0\0-·ôzµxÂœ\Ü}\ëtWŒZuKƒ\Ä\ËZ{Ëˆ»½\ì¦ö¡ï‚¡\é*F=o_ujşZ\ŞÜµ™kŒ¹ -¡W=Y¿¤\Ò\îZ/°Ã£5X„s\rÀ\0G\Æ\è£/›RÁ¼¯\á#j´¿‰OÁ\â§F¤jÁô¡%(÷®±\î}\æ\"u;2ãŒ”š[´»v\Z\Ô\áV>¬\ã.\æ¯nò\äN\Ş/%\'\æ“\Ş\æZ\0\0\0\0\0\0\0\0\0\0\0\0\0nqñpy\êU§yş<³ö]?I§7¿h™ú}\\°ªô\à<¡¬§\Õ\Ñ_kûŒÂ·nĞ¼2¨ò\ÅU\É	Kª-®ûiñ\r©´Cj\é\0\0ãŒ…\é\Í}[½+£1İ­\ãu—¥9\æIõ¤üĞ–bw›Í?=	\ÑoZS¼Ó©v¿‰L±Šw\Zy\ÏW\ÃË–/Š?˜ÿ\0a±%r@\0\0\0\0\0\0\0\0\0\0\0\0?:Sù:\ë©9yFßˆ‡7gk\Ñc\í\Ú\';+½\0³gPôt\ã6»\ïzÿ\0cg?%¹­2’«vı[R·Î’^_¹”ü<n\Ûg.€\0\0hÈ´\Ù;	z(9Tö#¤Wg[üŒ\ÏUY\Í5û:\ì\Ûò\rF”\æ£NQV““m\Å=WWSó%\Ä\ãú¯x¬\ÏfÄ\Ç\0\0\0\0\0\0\0\0\0\0\0\0\0*9A\É\êXÜŠ¤ªG&|¾\Å_5¯{§ÔmX·u®‹¿34ˆ\ë\î\È\í\ŞGP\Ã\äqV¥™<ÒõmÖŠ\ëd)\Ù\×\á=G&]Å¢:(1{.•8\Å\Ë4\êEjÕ²G¥\'»©[\ÅK¡L\Ó13>!zl¨A\Ê\Z·œcóc?\É#¹\Ã\ÇI•I…€\0\0\0j6<¯F¼¼¤Í”3F¯+<!Ò©¯eİ®µ¹¯+™¬\êv­—Ä¤\Ö[øMI&\ÓI§Ö™m\ç¦5:—\è0\0\0\0\0\0\0\0\0\0\0\0\0\0eyoW,°\ë\çJ´…5ñH‡/hu=2»\çı!—Tdë¹µÑ5\Zzï”\æş^e}uuù¢1\ê<\ÊY² Ñ«¬\ß\Òiw->\ã8\ÕbŒ7\0\éJŒ¦\í·Ü®›DwO¡±*K\Öj?ğ\Ó\âgHm\ÄV;,)l”–WV«\ÌR\ËÛ¸Ù¿3]¡œşb#iôiFQŠ²Z$¸!™™\Ëa\É|^zYø;~\ë\İ÷¯\Æ9\Üi\Å\ã±r\ä\æ÷])\0\0\0\0\0\0\0\0\0\0\0\0\0~sjeıõT©/,¤9¼;^›ş¯L…uô0ò\Ä\Õ\É	Kª-ø\Û@Ú±¹ˆc\Í]\'­<\ç\êÅ¾å§\ã,Z\Ñ^ò±¡°\æıi(ö-_\ä4‚\ÜEc²Â†É£g3ë›¿\Ãp\Òf¼§F)+%eÔ·E½¾†\0\0^òE?I>¬Šıù´û\ÉqwsıG\\µıZ¢w$\0\0\0\0\0\0\0\0\0\0\0\0\0Ás¨ô\Ã÷\×ü9¼;‹\Şÿ\0·ÕŸ\ØûE8ªrvkH·\í.¼\ÓÍŠby¡i¦®šk­=<\Ì\í_R®­Wô‡\èé¿“_­ªµW[¡¹»\ï|<Mw¹èš±ğ\ãš\İüCÚ†Ë£f\ï®zü75¶kÏ”\Ô€\0\0>\Â\r»$\Û\êJ\ï\È13”\Ê&¼İ•).Ù¬«\âm´ ¿Š±\ß\ä\Ölœ¨C-\ï\'¬\å\Öú»‘bµ\å‡#ˆ\Ï9m¿	\Æ\È\0\0\0\0\0\0\0\0\0\0\0\0\0:ş_ÿ\0cÿ\0™o\ï¢÷¿\íõgö&\n>’J\í·d÷+;n\ë!‡O>I\ß,%\Ëd\áÛ»¡N\ïW\ĞVoµnf9af\É\ï)‘ŠJ\É$–ä•’F\Èú\ËÊ¦*œwÔŠı\åp\Ú)i\íó\Ú\ÔWµ~\è°\Ş0\Ş|#\ÏnÃ„$û\ì¿3o4ù”y\í\Ùğ„W{oòo4y”y\íz\Ï\ÚKİŠû\Æ\Û\Æ\nB=LeYo©?¬\í\ä\Å+œ\ß\ÖË‡Ó…Xo\ÂI‹\ï(z­w\ÃO\å0\ë%—–\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ç\Ü\ê>–»ö\Ó \Í\á\İô_\Çû}Tûk\Ğ\ëº2û·ı\ä.†xûk%t¸´\Úğµş\Ó(t©\Ú­NKö”›Ìºâ·µ\ØÖ¦qı‹G´¨Œ-\0\0\0\0¯%ª\ä\ÆPùa¯\ĞüFôûĞ«\ÇW›‡¼~_Û«³–\Ş<\0\0\0\0\0\0\0\0\0\0\0\0\0\0s¨úxsö\Ó \Í\á\ßô^\×ı¾¬¦£F¬ùz½·\Ñü]k\Ów‰K¯n9§Ó„\âŸ~Wğh#Œz¼Ç‰W\ãq9\ê9¤\ãt®¯ôRa5)\Ë]J1†\à\0\0\0í‚«’¥9üÚ”\çõdŸ\Üf;´\Ë^lv¯¼K»^ \0\0\0\0\0\0\0\0\0\0\0\0\0\0ó§ú\Ì?¹_ù A›Ã¿\è¿vÿ\0·Õ‡ vÀ\0\0\0\0\0\0$®š\ìa—uÀVô”©\Ï\çS§/8¦]\Ï’9o1ù¤h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ç\\\é?•¡ş_\æ‰oA\è¿vÿ\0¬}X‚h\0\0\0\0\0\0\ïƒÁÕ­,”©\ÊrêŠ½»\Ş\ä»Y´D\Ïf™2\Ós^t\ìû\r:XzT\æ\ÖhR§	e\İx\Æ\Ş%ºÆ¡ã¸‹\Öùmjö™”\ã(@\0\0\0\0\0\0\0\0\0\0\0\0\0[w`P\ÆE*‰§\ä©i\Æûû\Z\ÑhÑ­«\î³\Ãqy8y\İ<÷†C\Í\ÕUú¬D$¸*‘q~q½üˆ§´º\Øıj¿Ÿ%e^Cc\ãº\å\î\Õ_ŠÆ¿\n\Ë5õn{\Ì\Ç\ì.HmşZ^)Q‡d±\ê\\4ş/\â\Ãóş\Çÿ\0\ÛK\ë\Óş¡ğ\í\ì\Ïü\rÿ\0\â\ÃõHmşZ^5)Pøvk>¥\ÃG\âş\'ü$S\ä>=ş\Î÷ª\Çğ\Ü\ÏÂ³Iõ^\Z<\Ï\É.7¸§\ëT£\éNOùQŸƒ(m\ë8cµf~P±\Ãóq\Úbdû)\ÓK\ã&ş\Ãh\Ãe^şµo\ÃOœÿ\0ñqƒ\äF›§*q«6\×Õ¢üQ´c¬*dõN\"şuú»_\á°\Ô\é\Ç,!G„a—’$Ò¯k\Î\í;z† \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(19,'root@sunilos.com','2024-10-01 01:58:47.940000','root@sunilos.com','2024-10-01 01:58:47.940000',0,'root','Profile picture',NULL,'images (4).jpeg','/User/profilePic/74',NULL,'image/jpeg',74,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z&!1!%)+...383,7(-.+\n\n\n\r-  --------5-+------+-----------------/+-------------ÿÀ\0\0\Ø\0\é\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0K\0\0\0\0\0\0\0!1QAaq‘±\"¡#23BCTr‚²Á\áR’³\Ñ\Ò\Óñ%Sbct£\Â\Ãğ$sƒ¢ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0)\0\0\0\0\0\0!12AQ\"3aqB¡Á\Ñ#ÿ\Ú\0\0\0?\0\î \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nÆ˜\åOCVT\é\Â3p\Ù)I¼ku¤—/©\é\ËRmv[›¬6¼³Y÷J-.4\åŸcÇ™\Ì}dÿ\0(\í\àú©z<¤³Ÿ\Ë$øJ3µ¬OQ\Ç~U\Ş<¾’÷T\ê¬\Âqš\ã)cÀ·¦^*6Yå˜“€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Šµ\"\å&”b›m\îIog-\ÔØ§\ßr\ÆoYR¦¢¾,\æó.ı]\Ë\Úa\Ï\Õ\ßñƒ\íW“m¶\Ş[\Ú\Û\Ş\ß\Z÷À\0e¶¸)©\ÂN2]k\Éñ]‡q\Ê\ãw²Yª\èºI\ÕQSi)&\ã4·k.µŞš~³\Õ\á\ä\ë\Çl™\ã\Ót’-@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Wùir\ámª¾Rj/\è¤\äü‘—\Õe¬5ö·†o%óš€\0\0\Ëy¸9¨\É\Â/XôS\ï;«­›øJrgJ\ÊŞªúu\ZR\\Ø¦‹½?-\Ã-|U|˜uMº\ê2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n÷-mœ\íÔ—\ÉIIıšoÚŒ¾«p\Üø[\Ãu’“oBu%«¹K‚<ù-\í\Z­\Ón\ÛC×©7\ÇW\ßJi¨\Ç\×\×\ê\É)Ç•¾¹HÜ†„¦÷Õ«\'\Â\Õ|\Ú\'8§\ßúG©\'C“–ğZ\Ó\é\'…W\İù1Y}Å³‡Ş£\×RPtj\Ót\à\áª\â\ã©\'\Ö1«½~›5\ïg*µ\áN;õ¶ÿ\0eEúO\Ø\Ì|xÜ³’-\Ê\êm\Ô\ì1>€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\Ü\ÑU!(KtÓ‹\îk2›š®Ë¥C’\Ôz*—ç²¬uWkŠ\Î\î\Í\ÏÖ?†t\åq¾Zs»’¬e\è!*]\ßÿ\0)Â’¡£\İ	Juş2¸\ÖÂ†s\Ã1\Ö\ßQ-NŸ\åİ¦“Û\Å\íşw\İ= ù/¦\'|\îeV\ÒVÒ¶¸©F›¨›•XGè›Š\Æş¬®\ÒYc&ª8İ²r.\ß2¸ª×¾›Œf[–=xğ+ô¸ù\É\Şk\â-&\Å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ\Ğ};U)KR¼V\Ée\ÅMpmn}¦~n¾øö«8ù:{_\ršYÕ²Ä°µ—	cjñ#<wM\ì:»sÙ®ûw\á\î+-#³Ë—´nR¥EF)F+rK	#D’xQ\å\ì\è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ò¯²LÏŸ•\Øøc’\Ïá°‰>F	n\Ïv[^Óš6Ù¶‡_wùWøl–«\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÑªòÙŸ.õv=£¦×½–;\Õ\ê\àW\ÓgŠ\ç\ÉS+:¸\Ê\Î3»\"uo¹zt”H\Ø\Ìú\0\0\0\0\0ó }\0\0\0\0\0\0\0\0\0\0\0\0\0ƒ\åG))\èú.n.¤ò£E¥\é4\ÚÖ—R\Ù\Úû	\á\Çr\î\ÊG4½\åÖ’ºœc\nŠ‚œ”c\Z1s\'…™\Ë/¯«ó‹…Ê¯ª\êªÇºMãŒ›\Ïyg\ã\ÇZ\ÒU\'ms\Z‹„º\×\ê<\Ş^\Ç†\Ì9&L\å)¼Ô¨¢²\Ş%7+¨\å²M×š:fd£(ö\ïF\ëÁ”ğ\Ëù\"FE%˜´\Ó\ëE6YÚ§.\ŞÃ \0\0\0Ö¾¼§F:Ó–xI&\å)=ÑŠ[\Ù\Ëdò³‹.K¬b3@×º­\nr›‚¦²Suj´\ÚÌ·({Har³»GªÃ‡®8\ï\ê\êp±Œ\0\0\0\0\0\0\0\0\0\0\0#´­÷Fµc\ï\ßÿ\0+ywU\İğ†yk³òómª\ŞG>4\ß\n§•W’´:K\Ê+ª-\ÍıT\Úö\à\ävºi4\02\Æ\æ¢ø\ÏÄ®ğñ\ßñOòeöñ9¹om¾×’Si4¶ùy$\ã=Ô©K+s\ß§ø\Ï	”\î”\ËK-\nªqR\çÿ\00b²Ëª¾]²tQ·7\Ù\äŠ;\åVö\Æ3Ó¦¢[2+¹m£_JĞ„\ç½YS”RMkJNQM8%–ö<l\í9c\éù2’\ã7/üûn\ÛQ8¨Áj\Åg½\åûY\Ù5\áVY\\®òò\Êu\0\0\0\0\0\0\0\0\0\0@\éVZQ­\Z\nn­yIG£¤µµö\åº8\ï\Ïa<x\îHÜ¤hU¨\ç\'\'½\ï6\É$\ÔQn\Õ\Î\\G6mğ?6¾ñI\å\r\Íı¾jÖ©ùQ]óyÿ\0I\È\í^I\"\0\0\0\0z\çVZt·vKøsã¹µœyw\ÒtÊ¹\æo	œ¾Œvğ\Â\Ï\"MD³½Ş«©8\ÉFJ2i\êÉ­e\Ôñ\×\ÜN£’\Í\Í\Än‹\Ñ=\rjµ$úG5\rZ“ôªe\'­\Õ\è¬\ãb\àG5v\Ó\Í\ê?&\ã&µ¾\ß\ÂX›(\0\0\0\0\0\0\0\0\0\09\ç8œ±•\'+[ij\ÔÇ»Õøg\ä\àú¥\ï«;6î»}\êeğ¨ò†½Û“\Û\Ñ\ÂO\ë6£÷³LU]’(nXC6U»:7\áR\'+±­\È[}KW>º³“õG\Ñ^O\ÄGj\Äu\0\0\0\0û	¸´\Öô\Ó^£–niÕ²”õ¢š\Ü\Ò~(Áf®šc\Ä\Ö\Å\ã\ÜUøOòÌ‹W+]U¯wIÎŒeN¢×œs®£8\æP¦úö\á6º\ÙM¶\åÛ³\ĞÇ>sıWs´øÜ¾oü‹½=H\Å9Jm/}<9Kµ\àºva\Ë.«½i\"\0\0\0\0\0\0\0\0\0,ôâ°´E–~…ö\æ£On8$›õv’\Ãªåº9¹6\ÛnRm¶ö¶\Û\ËmñÉ­R\İ\Í\ä6\ÜK²šûO\îD¢5s$Š?”œ\í.\"–_G,.-,¯#•\ØÏ£­º\Z4©şDbŸ~6¿!À\0\0\0\0b\Ñ5sF9ø¹O\Ô\Ì\\İ²­w“–^LV\î´É¦Å´ó³†\â\Ş<¾\ç>Y5”ğ²²“\ÆÔõŸRğ,Cw\Ã\Ø\0\0\0\0\0\0\0\0\0\0Æ¹\Ì\Ò\î\âõ\ÓO\Üí–¢Û±\Ôxs—”~©§‹Ey^\ê‰j+·7\ØT\ë\íYs‚K+/}^³±\Z¶’D\0\0\0\0\0\0–	O:«8ßµ\"¼ùq\ÃÜ8e—„¥„%8\Ëf^w\ç¨\Ã\ê9q\Îş–,.>Y\ÌË›6±Ù%\Üs\å^wáœ±\0\0\0\0\0\0\0\0\0\0\0jik\ÕmoZ³\İJŸ~¬[K\Ö\ÎÉ»§+ó\ÍJ’œ¥)<\ÊM\ÊMõÉ¼·\âlTòtnhij\İ[¾¨ş’$sö\Òywv)µŠ\é{œûŸ‘gÿ\0\é?´3ö\Ô!\ë0€\0\0\0\0	º]\èÁ\ë<Æ¯O\â·\ÌkÄ³°\ì\î7â°°h“JN€\0\0\0\0\0\0\0\0\0\0§ó¥y\Ñ\è÷öÖ©}U™¿³\í,âŸ©¼8\á©Xk9jÕ¦øN\ÂIœ¾	\åß™\ä6°\İüû™o\îcı£\É\í¨C\Ö`\0\0\0\0\0Z+t»×‘ƒ\Öy\\+xÆ½š\Ö;sÀ³w\Úß†\Ñr°\0\0\0\0\0\0\0\0\0\0\0\æ\Üñ\×\Ùg.´Ÿ©A/´\Ëø~P\Í\ÍK\Ğ\07¼\0ı”ŸCk\ßÁÏ¸³‡÷\'ö‡\'²¡OYˆ\0\0\0\0–Š÷²\ï^FY\î^Ÿ\Åo$d^Ş§$\ÍE6\î½p\0\0\0\0\0\0\0\0\0\0\09o<_iÿ\0¯Ú‡\à_\Ãâ¡›Ÿ ò{Ÿs;õœµ©S|a\ãy9y­³Áyğs\î\'Áû‘OeB³\0\0\0\0\0“\Ñ+Ñ—zò0z¿ti\àñR´)ckõa‡\ÍY–_°Z€\0\0\0\0\0\0\0\0\0\0\0\0\æ\Üñ[ì³©Ôh>ö¡%öd_\Ã|\Ä3sRô\08\î\ÚzÖ¶\ï*_aV~\êÛ†kßƒ—w\ŞOƒ÷\"<¾Ê†=V\0\0\0\07 =\äş’ò2óù‹¸ü%J\0\0\0\0\0\0\0\0\0\0\0\0\0pôc¹\ÑõuVgGb’\Ëz™\ÖK\ê¹\ãº\É§g5«\0\Ûù-,\ØZ?\îiû\"‘\åòû\ïö×‡¶7o~^¯4Kƒ÷\"<¾Ê†=V08\0\0\0\0z\ŞO\é/$e\çóqøJ”,\0\0\0\0\0\0\0\0\0\0\0\0\0>4\å\ß%¥cUÔ§\Ú\Ô~ƒ[z)?“—\Ç\Ãa«>©üª\ÊiU,p;G\"¥kô\Zğœ—\Üyœ\Şú\×\ÇíŒ¼«\Òq³²­^Qs5\Æ-&ó8\Çf{\Ç\r\Örœ\Ú\æÿ\0Îš\Öüúg¡ù§\Ó\'Aü\è\ÛüÖ¿\çRıcóO£¥õs£mók\Z?´?4ú:^—:6¿6¹ÿ\0#ö\Îşiô\çK\ê\çB\Ï\æ÷~ûƒòÃ¦½®s¬¿©»_R‡\ï\å\Äé¬‘\ç.Áü\Òÿ\0\×K÷ƒò\ât\Õ÷ZjıµJ´u\ÔW\ÒEFZÑ„Ø›Ù‰\"\\¦W²\Ü&¢\ÌT˜\0\0\0\0\0\0\0\0\0\0\0\0\0z1©\ÅJ2X”d”¢\×ğ)\Z_›;j­Ê…IÛ·ñ\Z\éi.\äğ×‰t\æ³\Êù¯»[«Ûµ\Û\ÒGÙ†KóO§:nN\è¹\ÙZÒ¡RQ”©\ëfPÎ«Öœ¤±ó5\Şv´a\Û:óÆ‡º\ív\ë\Æ\â™\Î/q\É\ípS8\0\0\0\0\0\î¼Ã¿\è\Úÿ\0\âª~†‰’\Å\Ò¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0•ifLÏ•\İ]Œ\ÔRy\ŞOù¾?¬¶\ÏwOÀŸ¹Ok‚šT\0\0\0\0À;Ÿ0¯ú:\ç²\ê ¢G$±t²)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ù-\Ç(\Ğ3/VyÊ¥¯¢/WF_™R2û‹8ı\ÑOkóÁ©œ\0\0\0\0\0vşaı…\×ø§ú\n$rKN\"\0\0\0\0\0\0\0\0\0ÿ\Ù'),(20,'root@sunilos.com','2024-10-01 01:59:13.171000','root@sunilos.com','2024-10-01 01:59:13.171000',0,'root','Profile picture',NULL,'download (2).png','/User/profilePic/78',NULL,'image/png',78,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\á\0\0\0\á\0\0\0	m\"H\0\0\nPLTEÿÿÿ\0\0\0ÿ»şCş\İ\Ì\îª\Ì\Ì\Ìüüüÿşÿş\İ\Îı\Ş\Ìÿÿı\Ó\Ó\Ó\É\É\É\Ï\Ï\Ï÷÷÷\á\á\á\Û\Û\Û\ï\ïï¦¦¦zzz\İ\İ\İ\è\è\èaaa¬¬¬{{{¼¼¼nnn\í\íí………VVV›››???µµµÁÁÁHHHjjj***“““\0\0\'\'\'OOO[[[ÿ\ì\Üÿ\æ\Ô888\0\0\nÿ\Å\ì¬\0ÿ¸Àº­qme\â\ÕÊ±ª ÿ\ä\Ø$\0\0ÿ\ë\Ös\0\0\ÕÈ½û”¥ÿ‰•ùÀ/úKÿ=\0\0ÿ\È\í\'L­%D\0\05\0\0Õ© ’…Å»µ†w@=6¡œ“{sjğ\Ú\Ô\Z\İ\ĞÄ¿¯¡\ÛÎ½²£ÿõ\áÍ½©($ UNH—”…X\'ƒø\î\åO\0\0\È±$´l$2,W\0zu „n!o9BS+*‚“$Ç‹’\Ãyƒ†^e:!$ÿ„šfKI\Ö|‘´m}ßŠ‘N89@,kS\"c˜tbN(¼—)tT$Ñ«95*ªŒ4¾ 6$»‡!\Ñ7WT<‚ 5m.@ug)>871\"™t(m,C\"\'XL\Ë\'A\è°:(\0*1A­FC	+JH/±5Gi4\"|\0\"*18,\0rX\r\×-}/<FMXÕ´Mù¸@I:\0­›LÎ˜\ZZZ/,>\"%„‹‡\Ğ\0\0ZIDATxœ\í]‰_×µ\Ë6B\ÛhC;\ÒhCBˆI³˜’\n\ØÂ€ml§v©\í8u6I›\Ôy/­\r$^°)®¡u_ò\â&\İR¿ö|÷\Ş\ÙG3#Ù‚şøò‹Ñ®û\Í9÷l÷\Ü+‚8\Æ1qŒc\ã\Ç8†\Èf\àµÁrƒt¼\ë?”¡+\ÓœGX¤-’\ì\ëñ\Ñ.\å\Ã.P \ßÑœ\án»\ãqw„\äbòƒ\Z\Ğ\Í\Z\â@%ûlüMI)UK€\ÔTT\nx$Céˆ\'µ;jI¢\'\"»›ğñ7¨¼6A(\Åfó  cò{~#¦Gğ\È\ÍE\n(\ìc4\Îı\r\ë\àhYTwNf=\Én@‘Hs\ãFAÿ‘ò‹±ü^*€‰\Z\Ãy„’@\î\ä\í€B:\Ã\Í\Z\î>@¥¥\Û$\ÑK\ã\Ş:¾GT\ì\æ´/R—¡½9£\İ’\ÒMH\à¿dº.Cw“F»\Ø@·x;\Ã{F{]‚À£óq‡\Ö$ˆK\nø\è4SŸa®I\Ş\ÈD¸)Éµ%\0³ÿ?ƒ¡3\Ò~\ÈOòl©£\ïh3DŒ(;´–\á\Õ3À)Ü¨qxA:\İQwÅ¡£\'‘‰ğ÷\É]0\Ìh~vóAYi4\Ç<6-‡m\ÍSr\ãotÜ»ƒ#\éA\ê\å\ÖI::\Äxº·>\Ãn\íQ\Âk…Bvo£Á\êö¡a…\ãiOw>,0Œ\Õ%\Óÿñ;\â«S¶ú/\ßĞ¼\"­4œv 	\áki„E\ëQ?hó\×ûj§²\Ò\çMe*Ym\ÅüŠ¸Kÿ\Å!!~#uRu†[3\ä»\ZEJ‡ªs\Ë?\Ù]{\í%{\êW=‚õ,©O[î•\"/cÌ¯Yw<*~‰+‰\Æzóın™Š†%\0z\ëU“ \0\ãw\í	$ª\åf„ÁS^»?\Î%ûe°\Ûá‚w\Å\Ã fËŠÙ¾Õ˜aÃ¡\Ö6\"nt»\ínO²·\'¦CŠˆµ^\Z¿¸G\Òa)p\Ğú\éóŒ.O\ã5£”ğe5^\àªı|dm}|\Ù#&}¤Ã€`´Î—\ë’1œuŞ»[X\Ód(|q¹[&	\îµs0-³Cn\İAö8\ãt\Ä\ãñ‚n›ƒ¬u6#ñ\ç\Ä0H\'\ã”*î¤€~p‘\Ç\ë1@^u326WgG\ÇG†\à\Í\\Æªú,c+Õ€\Ú\0‰Rô¨úk\á£~\í²÷\ÂW¸€\â]zI¢\ï\ì(Ãš˜\Ñ9ô@:\â$$Q\Ö	Û³(ae¤°˜r$ü~ÈŠœFO\È\à==V¡’(A³¢Ø¿È´azmc?YôhN²®u\Ìp#„H\Ó\Ùt2R±970gˆ\r\ßØ£z0T3¼\Â c†\Û†fFtR°!\ZK\nô˜ ú Ê„zA°Cš‡\İt\Ò\àMD\Â\'c-§‚\Ê\Ñ]e8b\"\Ì\æENˆ\á\İÕ’z\íAœQ9 RÊa¤\åô@g¢Q?£BX\Zğ\ÙÔ¹Z‚m\Ì<|bhad¡Ÿ¯¡j®ª\Êa\èMwn\íÈ—T\Ûq{\È\È\Ù:‚D\Ğ\İ[\ã­ğ[(\Ê\ÃlS1„`\çÀ\Ü\èkf™ós€&\ê\Ä\nv>\ä\ÔµUw—\áŠXG‚\Ì´ö\å\å×‚kT”cxy„\áæ¥™G\Ëõ\ëtµ¦ş¼ò6\ÃI§\á÷¢2†A®òv‚,:\Õ;;Y>\ì\ë0\ÈÕ—\áÁû\"H†{~THGZ\ãa —M?\ÈÔŒ™É§$\ã\"H\ÕIK@–<\\±^·Ã·Ÿª»Sãº1nXCŒ‚\rsqh1+\Õ2dG\êò«›™\Ô‰š\r\à\çdq¯ğ@ı÷ ÿˆ¸FõEÉ°YÎ¹\ê&CW\ÇTŠ”¹ZŸa\â€t ±\åh»‘Ÿ\á\r¡6j®\ršùy\Ñ\Æ\\AN­OÎº“{\Æ<^Ÿa#\æøˆ»Ë[o\Øo­c¾\È0zƒ«V\Äl¼S$\Ò\Ö9z5N\Âw‰)\ËJ™º\×\æ€i:\â\Ôj9P9ü¥‘šNR\îFdhn½\ì#,Ñ¿ˆƒ7f\á\ê\Ğ0’a\Û\èl]†¯aù\Øe¥\Ñ\Ì\Ì\éÔ‚i\ì\é»Ğ·w+ôTÚ \é¬‰y¸ ?‘GZ\Ú9:\î¶_\å\í\ä_WM•\"J\à\Ç\ÜE\ÇP¢#‰’\ä!#Hm\à\ÜE\Ë\ß)%ú#¬hL\Ì\ìl\Ò3™\0i›\Ùyô–\è°È©Ç°‘õ(5¼¨¼òÁ„CL\æœ\àÃœ\É\\­\nI\Î{\\²)\æk|’\Ò=£8ötK\"%yKöJ†¼u\Í\ÅUÀA>Fğf²KY\ìÒ“¥o²Lo\Ø,ú¾\Î\Ë\\§	™8Ç¶™ûLˆaø¬È1*\Ó@¨S´\×BÕ‘ =ıù¾¾ˆò…¸Ôš ½Na¡+œ\ç—ƒf3P½\ÙB\ä$2uÓº\ë\r…7\Ú\ç¶9l™>\Åx–—\Ûsg\'?\ÑÆ„k\ĞË´1sAôjy\â¼\Ä\Ğ80\í{£ÇŒZ©NKò\ìW’a\çEŞ£tÁ\\\ã<,ğvwöš\Ä0j\Èğµ­B@*™²|ñ’\Èpt\ÎT\Êo\'\è–\ãU.>4*1Œ4 [‹\à\æ&tYñ¡±f\Ş\ÙM.Py\Æ\Ìöby[ˆ\è dk\Ùc\Í\éiT¯4qj\è—\Ã6v¾µCa†] ¹K\Ô}AŒZ\ÛÚ†\r\æ›\Ó\rW»Ğ€\ç\nª\\œY>»ıb¦\Ä\ÌShu±7¿­ª+\í*=\Ëò¥7h‰.r\\´$™$›\"AD‘V\äI˜ˆ˜;\Ï\à$—e‡XA\r™y®\Ú™Q¶Uš<qMô–ffSGW­[6³\'UU ó¤\àú.N@¿\'\äó\ì96–\Ãfv!\Ï\É;3+\è0JyÍ²\ï(fmj_1¥\ÊylDn	P\Ì(D%±¡\Ë1\ËruDÓº® K!D<B\à‚ü„\ä\Z\Ãvu÷Î›F—JO\ã\éš\Ê\ZJ\Ç/\Ï\åòH6‹‹Clƒ\Å\Ím\"C1¢\á£OkœÒ¡×°„¿w¨‹ñ#\"Aau¶±\Ç/Ÿ½<ÛªÀ\èe	\"0‚t\ÔÌ½²sQ\Ò^j‡¡)œT;şa8l¨œ,3>2r–\åË…¨ğË²ç™·\ßf\ÆÏ¡W¥ˆ\È,#»£Q%\ÃC\åT„sIft.›,Œ˜1CvDaŒ\Í\r2\ĞÂ„9µ \Ófy©\í2$œr†\ÉQH\Ñü0ËšQÜŠ0\Ã\ÒF¡\ì,\Ã0\ç Á•¦i»5C\ÅTŒÁl\Â<¯Ím\ã\×\Ò:;G•\É\íevl$-¬e\à>\ä\åù^Èı\Ñy\Ö<2;\Ú\É14³—\åÄ¹1vğªP£‚\å\àõeò%#Àp®\Ş<\ã¥df‡€\ns,{‘/pt2gOÒQ\Ò/™¹\n(“\×{k\ë\Ù\ãĞ¼rÏ÷…„ƒƒĞ‚”õ^d;ñj\Ë\è‚V·±µ¥\Ğ9–/\àtšG\äû\ßD5f? ‰˜8\Çp…-ò!52\×&Fóby\Ú[fP\â\á\İ%g\Ò<Có\Ø\Ğ,ŸÀw\Ö\n±_VÀ\äM\Şl½Iü:\é@8q\ëÄŠ¢\Ë—$7\Ì-Â¨2ò\Ù6‚5)*\n\àT½À?\ÑDC“€\ÙM>™DŒ[3\ã\æ\\FV\\04³sWF;¹“¶Q\åú °ğ\Í5\Øt\â\ÖŒ\ÆW\îw	\ßc\åŠù]™,Œ›kM%ÿ¼\à%†\Ñ\Ú\Z–½ –\Ü\ÚÌ—~>Ì¢°UH€\é7LLBT\ŞHº5K_BŸ\Ğ\ï\Ì\ìğ\ã1!†±÷ø\ìÕ\'’s—\ÄR3{\é\Ê,×°ÀY£7Ò_T­p(„\æÍ†5¤(.ûò\İOLt	Ì¢H¼\Ó\ì\ìd\ÇXq>Ê\Í\áv0\\\Ôo\Ú\Æ6J\ÕT\æ\"¨4]û2ò„¤„ˆ#;÷ƒŸ\0\Ã[\rÀ	\Ø\Ùy\rÌ¡üi®y\"”\íM\îg—VO«\Ú\\d932rı\ÆO@\Î4m†8­\ZO.€E(\Ì\ÎTSnVDT.ñ’D\ĞC„´6¡	½i\ç9?0~ú7O‚”o `N\Î\'\ìù¡\Üù±¹s(\ÂAe\ßf1\×,NFRqq\'\Ô\İ‚\Îs6ô\Zx\çÆw\nòg±\ïRòffx®g\é4_Ë£\Å\Ù\İmz\r@…\ßÚ®.?°¹=\'€rO>)\ê©Sb’\Şx÷\İ¿ş)¸5ÂŒñ6•\Ï\n\Ùkg}Hº¨\ëka…\ç\Í\Û?\Ûz5¢Eoú}\rz­2İ’z(¡õ€’\n^\nñÆ»\ï|xøFY†Á\Ætlô\Ò\àÈ0,\×Ù†JR\ÃM\Û\åM}Q\Û	­g°R‘A\å>JH\×\Ï!™\rb5…,o¼{óg\0Üù\ÎÍ¾÷\Ş\Ğ<ŒŒ|‹\\aœ,3Ô¬p†$\ÜÀ\ë\Òh&ù†¨\Ã\nõ·>\r½ısvü\âK\ï¿ÿÁ\ŞA$}ó\Ã@|xó—\'ÁeÔ­`\æ+\Ğ-7o£>•†*\Z5j¸òZ~W,i\ä2\ãL¸÷WoAü\ê\Ê\Íwn`Ü„á¹¸ÁÅ¥Ã¯µ\Ó\ÂvT9±¦mV\Åõ\ç\×Ü²\ØŞŒŸ|\ë‡o}ğk\Ä\r\Óüt‘2›ƒ\×øûö\Úõ\Ù@Dğò{\Î\ĞGz\äÏŠyTgn}„~ò\Ö\Ç\à\ÌõŸ –\à²ğ\Ó\Ã1\Êòzi Š·O:úøH’R\Ö\0cÁş˜ûì·>ùä“ş\ë\ãşû£O{\æ\æ\Í3`v¬M\á\Z™A\ĞOZ4š¸?\Õ\íp8¼İ®×´L\ÚG\ï\"”\n+ö s§Qt\Ï \ãûø“şğ7PWáŸ·~ó[\0\Î\Âø»Mr\ì\è9\ènI9AºÕÈ¤dUœ\Ïr):\ÑÍ¿¤QIy\ë¾\Æf%ªÀ%Y\Ì3}m´÷S4¡¹ÿşæƒ«xÛŒÀ¦T ­¶¢A\Êø}\Ä\İ{\Ë+[Ÿ\ßÿó$\ĞÆ¥Fq¤€üx°N½Ö«¬> ƒ†\â1>\Ïş\æ}\Ì’üøö\Ó\Æş\×‘~¡%ºv¬ğ¾#R\0\à\Ûg\ÕJQBü¿ò`\ëÀ\Ç6\n¤¢m\×)g’Š‰#s\Ğ#,€/0£³\àƒ?ıô\ã;·`ÆŒŸ\Ç\åF\ßú@Ö˜\\¢£\Ên¥Rl\ÑB±¼I&m\rZ|#•YRJ\Ûm¨L\r¼\ã­\Óa°0Æ\Î½7‚G\Çû\×\àŸ\áÅ‘¹ß¡­a:¢\0<Õ¤W‚À$+÷ ¿Ezc:8\Å\Å!¤zGğ°jA…\Û\ï\Ú\çF’ô\r±ccc\ÌyY\í7\éñk\r\Ğd\Â;Š´ù)¹ó9\0Á†Uÿxğ\Ê.:IQ<CUvW\Üh?\ß}¹¸07Ï“³R”®İ·]=\à\î\êT~˜\ã«5\ë>¸m\ÊE\ÄÅº;\éG¥•~tj¶\ÚÀ\Ğ-š\Ğn6LA\ZRó\ê\Ã\áB³RO~\ÊË \à$p\çA$ŠG\è\ç5\ìÀ—è¦º\Ü\é(Y“ğ;\0p\ëm—Õ­j[,$\Ò\î\Õ\İl)\×QÿU5ï¯©V\Ğ8He¼¤{‰°\ê\ÄOÚ\Ó!¨¸	i¬•w\Ë)jq\í>˜¦[»‹°hJ \Ä\Ü(n‘ô’÷(•”º\Ç_B†:6\Şb\"hp·\ÜR\Ú\ÅRñP\è>–\"wˆCR/H¹¤sHâ„´|A=\Ê*G\"¦\Å,\í\ãh\ëõQ’02Ú“\Ã¨¨\ÆYA]\0Á±R>ùŠ+ªoq¹—´iò\Ëù\İ|C‰\Æ.0‹€\nõP\\ôA¢°\â\ĞAŸG\äøH\'ğDh»U´¯”_ó0¬¤–V\ÜZ~šD+«ú²\ÒGùËƒ\ébÖ€vpõ\ä\ãx\Æñg&’¢?H\'S@€\Ö\Ş\é\Ú—wk|_\Ë6\ÄÁ²¾} ¯¾\Å\êÁÎ¶M(=#“Š\ÄDW\à\ÂO9¢Mı‘Dd“¼³Ù‡/´\Ê\åªğ¥Á$\\­êŠ±X~\ĞÿFª—, üº]D\'Y‘\í3{­t.\âw‹S3­•\'csı`\İH—‹úW\Ö\Ô:È:5))\á±e2AYş\ÒD+¢P\"¢o­¬?\ÛJ\Å{.¯¡Z\à¾]%48dª\ï~\è\Ğ\'& ¤\ê\">=İŠ0nÛ„ıS&xµ¶c™\ås³òı2„şO\'¨^Z\Ìs{‘“¬+CŸU\İ\Òü°•\Ãôğ\Éf£:û¥\êq®$‘X\×aˆİR8ˆ\×\0¾9\îƒ\Ã¤a>A³“Ò¤%¦Õ|\İ*`bû	ğ8˜‰$ú\ïN)\Ç\r¹üUC\ÕT*\Ê\ï\Ëû\ç8\ã‡BFU/’„!Fk©\ÉxMhúx¢U\Â\Ä\Ã3 \ìÀ\Ú“‚’ÁT¹R}ğ RiW¾2`X¼\Ü~¿?nsz÷W#sµƒ‘>¶\Å@CkÏ¹Ø˜˜l•cb\æ:.\ÆS)JaI\ËÕµ\Â\İûOŸo6\×ySş©)nI_’ûXJ\×CÖ‹‚ıó\Ùòµ¾CM°µur\â\á>À\Å\âUi¼\Õ;÷«\å)T{*W]XŸ\â\Ñ(d]4*Ûº¼¶x&…S˜;&i*Kƒ¤Ê«ºzi»¦ôh\å†\n(NNlo€$Œî…ˆ\rN¿­teŠ3+¨¼V~zw)\è£}‚-_(V8)«8·7Q:b ¬|\îqw¹j=F4\î\"T\çaeub’­\Û\×a\Şrª\ÊY–bKõ$Ì P\íóm)M­ŸFù\çU†«µ;]t\Äğ¡%»$ô\ZiĞŸ¿\Ú\ëK&ó©8\áğG¢¸ \Ó¸ù¶\"yW\Ş\Ì>\Ô!\È\é\ê\ÉÛ…E\äJ\År%ùP”å2\æY¬¦\Ë0…0bXA\rw\á¥{@d×‚DO Z\İ6E¹œ¡H¯NÙ@<ö{…7¦uùqƒ{˜M©T}>UB¬\î\0(<Z/!\ë-ø\ä²QP‡\æ¡I=4GD­zu\àŠ‡ù\0³\' >jW\È\Æö’\Èp\éa©Áva‹®ek‰m¹ ¼{zŒ2¶B[šĞ«ePş\Şğ³+\Ò]b=·“\0\ÓĞ†¤og\ÓO^ò3f9ı‡­©b¹zÿ~µ2µ\Î\Ó+@ù¹\n	o\r\Ş7L\ã}ô\Ş(\îxˆMOÈ¦ß„!\Ç\É\éS§şø\Õ^ü\éO/ş\ç«ÛœÍŠq<×‹[\ËS+ó°œ\í1\Ú\ÜyGƒ›‘LDø1ÏŠû39ñ\â\ÎüÆŒştœœh\İşz{\æ—¶\'[\'¦ƒB>ğr,¬¯?+n0ü\ÌÖ‰K)\Ï^[sM\Â\na©-WZğY­Ó“r‘½¤Ñ±aff\ä\Ä4ò\Ó\è²\Ì\Ü\îc¾B\\­¶<\Ó÷‡PI»ŒBùÙŒN«beñ\ÚCñ\Ío©>Õ´‰of\ÃBY )p¥~flUE\Ì(\ê…rË²~L³º«C\Â÷ª¥Î€°õ\Ô{5+œˆ³ûŒ\\\\w`¸OĞ§wGqbC\æn\n\ÙbiG/\É/•\ï‚ÿ²-À½•J¹R©n­SqT‘W‚33\Û\ÂL<\ã0qö<¶w\Ãpr[\Ñn²Á\Ä\âÀ\'¹©B]›\Õ\"\nˆ\Ñe-Wï¼µf\"\Ğgf\â\Ö%Ab/\Å\Ğ=¾;ŠO$‚\\H\Õ\Æ\ÔJƒê‡š\æ<ªEy¶Vj\Ù\Ù4\Êc\å‚ø	\×oyŠ\ÛYJh£O\îJQK1QhOB8ˆ©g`¾\Şù\Ò{…\r|_\æ?^ø¢bKy¨ú¢-„\0\ï\éI,’\Ç>ñyŸ^®€\Ü\Ö<\ÓNK¨’8OluM\Ñ!|¬ˆ‚\åªÊ A‰&A·\Åd=\ÃÑ™>\í ²3u\Ø!<”\æ\á¦F~}\Å>Fv@Xœ\àsè—¹ŞˆY½RTw·;\0ú\r(÷K\â6:ı\ÄdB\Õ}B|(\á«J¹,tczS^}\Ã\ãFp\ÆÓ³\äg›••\Íl¡p\áùƒ²RuŠ(ÀW^Mt\"*Iø¶…!ûñB½…¤¾ÙÜ…–ò2ô\Ñı†¾}¾¼µ^­`T«\Ë÷:v¼Á3ú\ì0¸zzù\Õ\ÎÀ@¥z¿ r\Â0\ÂW\ç¹´‹ ]Ok2\è@ı\r\ÏÔ‰\Ã[\Åy\ÃR¢º´\'zJ65\è·\Z\ZªŸˆ¡fô\ë\åv¥\ÊS Œ\Ëk½ª¯t\á#-\ÜÂ´\Û>™sA\Ïi!2/\ë2œ€\ÙWº_}\Ê\å\è²Z\íV§£Á\Â\æÁj{ûÀ\0Gq T…a¿œb\nÉ¤\ĞT+ğ‘µ$L;R\ãÑ¡\â\Öa89\r\"\ê„I¸Oê¶Ÿ~P€üx†#¢(™¹/º¡1‘†„j\ÙW\â®ÿ8T”ù\Æ\ão©¾¥yÜŒ\í%–\ŞMHNÆ°}\àbU³T‘(l\Ã\íı§\ß\ïy)b&[§·Q0W\ÓM\Ù!”\0U;Äµ}`Y±\êW|\nHªÔ“0N5…n˜\à\Ï<1\na`Š<Q\Ëw\Î\Âfº“üv@œ„Ê…-ùL\\!nZ\Û70ö\Æ\âx©Kqf„­Š<’\'¸Ñ”]\ë.°Ò®\â\ï®dB,¿õq)D·ı¤†xUÜùz{{zZıüô\Ú\áø\ÆwYü\à•Z‚ğ\ît’±>¥‡D\×\é_Ö¯¯µNl¿¸ƒ\"\ë\Ó\×_\Îl‹‚FK6\Í9Y!µVV+)š‰O\ïO)\Ô\ÔJ¢¼\â÷/¤\ÜPS=¡\07Nƒd¦ƒ\"\\tÕl¼˜8¢®†´U\î&\âöwØ’ªQU¤6e@C#\ê<ùòñ\ïOl\è\ÚÌ‰\é™%p+c•\Ñ ¡Œ\'w\ëÖ­dÀŠÃ§7N\Ğ\Ò\rVj\éµ#5•;Œ\â£0´4\Ô\É\í¿üe{\æIú±V¶\é=ù+ˆJ?¾\ãR\Ş\ËŞŒ=z”UTµD\Ø>p_aM—ó\ÈÑ»\Ï@Š\ä\Æ\í%u	qûñ\Æ\Ìôô\ã¼,o\å­/\ÒLS\ÔSC¼\ÒaûÀ\Ê}y\è¶\Â\0?=ƒ.Áü\àôcÇ‰i\\%i\ÚfC}@SZ\Ñd\ØşJ1«\0{|¢\ë\Ö\Ë\í\ÇY¼ğÀÒŒrFNƒ©y›d´a\"\Ü:²ò:\Ñ+>‘:¦0Ç“0º;*iB\è1lx.\ï[®\á–Mµ<œ\İ\Øªü÷°I\ÍC]†\í\ëdw\0÷K<\Z?9’½ó5‘\×\éfó\ÑD\\OK\Û+@\Ö\Ù\Ë1T5õ!zÙ“33é¥‡­3·šd/`\â2M‚\í\å/W\å\Ñğ5~R\å$6®_/\İù\ëi\ë¡\ÓQ\'X\×a8ğTÖ“¶sJ»•¨/{òú\Ë_\ÎlÏ¼\0‘Cq–\n´]kKg¶W7‹¢+Ó” ¤\ìn•ıùV*D\Ô,r \å¤\Â=[\n\'\â?$\Ñú	¼€¼\æ\ß\è\nY\Ã]+k¦\ãšTt[ÿW\n¨g{½\Æ7]w1°õ”\çW*>Kÿsù\Ô\Ñ$HØµ)ˆ„À­üh¾\\,o‚Œ\à\á=¿K\rğVndøq	³|\ïóU\Ôz–4µ¿\Ù\ã\Ş=|Êšù|ğAU«Ï¾€K•5AŠM;\Üj\é«\éƒ5\Ş#¾jy¶¶\ÚR„6\íÜ }€OõL\Ì_<ûû\æ-xµ\r\ãpÖ©‡°nz1°É¯`”ŠŠ\åM\ÔX?õ™›7¼nXµ747W\äù\Å?\Ö`(^*Ÿ\Ş\Õ\Ïp*X’keMŠ\í;òDjõQ\ÕNGjb„´«Q(¿XS´¢ß«¶p‹mG$\Ñó½–·@u\âõGSBğ]l)\î \Öú©\ïC\âú€¶wÀ8!\Å\çU¤¦Gm\Z¢Jt|W)©—/J\ÏeIb©e•\×O5{\Ä{J¡\ì PX®”\Ú\Õ\Óq ½ú¥Œ`KùK\è \×\Íò~ÿüÜ¯\Ö&R”÷-\ï½j)9b¸À£re¥]y5PRª\éúı™¬[Všxú\Ó[\í-¯–/Ü¾¿‚Kii ²òUZ^®>k)~O7{°ûú=\ÇU¤”\åJõ\é\æ¿ÿ½ùü\é\Ó\ç\Ï7ÿø\Õ\âòç²–\Å\ê³b\å\è9|“…ú-•ò}5¯ªT_UÙ‘7ºn­L}Tr{%L¢\Ü\Ç+Â¸1CÜ\\*\ßıûw;„%µ]\0úDK,+ra\á\ÖNAh“,\î\0hl[\ä›:WxK+´iº\"q%\Úø¾º7\Ú¬¹\äı\êK¾}¸Ú‡\ì\r v’0Xi©I3`\"\\\ÅB,­ÿË¢±\Õ\äÁ„|Æ½\Ú\\q`k\×÷Ë§ı\ËO7j.,\Ğ\ŞÁ\æN\r\Å_\áY¸~Š:\â	4ú8¸PP8\r~ÿ\'ÀúG% R“Å™\Ë\í’SDy0j*~UõxT-‰ ŒX\ÖR{¦ö[§¨C\×i±/ µŞ<X[	–ª…r±üyÁ{”­¨\Ø\Ä{\0X†\éb	\æ\Õ¯–\×A\ÎeÁ\å?H6ôcG\ß·üô[ğ\Õ÷\àv¼}…¯&“…$([Ğ‡NSıÌ—±\Ön¸<òP/K\Z\'qŒc\ãG.¯³\Ëj·Z\í6;«³Ë‰\à58Lş×±l\îH8\Zöûú\Ã„HPˆ\ÇÆ‡=)ø|e2—LúRO ’q‡\Ö\îFo\Ğn,H\"\ç¶:^‡I\Ê\ê´\ÖB|¿\0¢\Ë\éÀRµ\'¡xœ„\Ã>O\Ğo7øÅ‚\æÂ›	§Â¾°\'“¡i·;d\ï¨›üs·\Úü‘À\ŞN\ìx“ )\Ê\Åb·\æ\Î›G›Á={—«ÿş2©\ÌN¸=$\Éx(²©\ĞÁ\Û^a» 8õ…\Úl	?I\åšö›{‚«\Ëj‹û\İn:“\É€\0OÀƒl„\Ç\çó¥\Â\È\êD\áŸ\'¯Šó\Ğ\Î\ÃÆ¡¹?Œc\ã\Ç8\Æ1q\Øğÿ)\ë¬úB&›\0\0\0\0IEND®B`‚'),(21,'root@sunilos.com','2024-10-01 01:59:35.199000','root@sunilos.com','2024-10-01 01:59:35.199000',0,'root','Profile picture',NULL,'download (11).jpeg','/User/profilePic/72',NULL,'image/jpeg',72,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z)#1!%)+...3D?,7)..-\n\n\n\r.& %-.0-/---/5----7+----8+/-5---/----/.+--------------ÿÀ\0\0·\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0<\0\0\0\0\0\0\0!1Q\"Aaq2Br‘¡±Á#3\ÑRs‚ğ$²\Â\Ã\Ò\á\âÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0	\0\0\0\0\0\0!12AÁ3Qaq¡±\"4r‘\Ñ\áğBb#$R‚ÿ\Ú\0\0\0?\0÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†¼¦­’*K\ÚNYeı:Yù\Ø\rJ›OJ¤\ÕLE¾¯Ru©\ÆPv\äŞ‰\èş&\Ü31\Êl6\Ô\ÃÕ–ZU¨Ô—B¬\'+s²f&³`m˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%¦¹\é£iüW\0#\êR…9,ª´\ç\Æ1U«I[œœ¥•/6v¿mfG‚ovÍ]­‹£I)Ti¸©J\Ì\åRÙ¤\Ò\àù–X\ï\Ãš6¬LÎÉ»;/\ÚXb(Ô¤zpRi8·7\Ñ\Û<[úü.b\Ùi—¢“«6¥«\ÖD\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W¶w_	ŠÚ˜ÿ\0\Äfr¶¤c\äY%EEË¿Zgk\í1\ã¯·ùñwÃ·×‰5±¶:\Â\Ş4\ëV©I\Ù\Æ\ä«*rOGNM]-86Ö„,™¦ó¬\ÄDú\ã’eq\Är×“±À\â:H\İñZ?¥-\Å9qğ[FÉ»\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06¶ı*\à0ót\éÆ®!Áµ)RÊ©&¸¥)5›\ÅhI¦\Ë{F³\ÈJ\î®ı`ö‹\ÉIÊk_¢¬”g$¸¸4Ú—“¹¦L\Ç\Îz \â\0\0\0\0‹zX©\nRgFx\Ï\rM(UrPÌª\ÔY¶Ii\ŞN\Ù\âo‹H9÷6¬\è•ôyµe‰§V\Øz)Ó”cA8FSj\î99¥—[ûD·Rc\íL\Ìú\Óp[Š\'–F\Ø\ë¨\ß6şˆå‹£†\Ó?m¼uG\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\é;*U©S„–Z4Û§ˆ©Ö­5¤©\ÅöAp|\İû8\Ølø\"#Š\İYy¡,l\ì\Õ[¦§øl\İ:”eG\"nJ¢z?ñì±­\æ±Y›t\"&yC\éÍ´&…:©[:jqºnX\ÉÆ¥7n\Ø\Ê2‹ğ)\í\ZNŒLh\İ0\0\0\0‘ß\Õ\Âc9\×ucR’”a\ÑJ1\Í\ïi)&­«7®\Ó8c“®,Syö5·saC	O ¢\ç%)Jw›‹““Iv%¦ˆ‹—-³_YN­k®\ÇG$Tyqñ:Ö¼1¢¿%ø\í«1³@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05fª\å~¬•\á\Ü\×iÅ¥´—^œ|Q\Ö:©‚¨Û©w{M¥Ü¹\nNº™kÃ§©“\Z\å\Ñ\Ï\'­–Y}\ì®\ß3¤ur|£M\İ.ô¸ñ.\å—}¹Ûµ€­„üV-\ÊÑ”\ãS=eJŒT^\ê\Íh\×V\í;FZ\ä\à§ËšN,tšñY\Ùl\Êø:xiV\ÙÔ£R	¸%‡ŒiÎ¬Ô”ræ³;¾-\ë\ÙrJ\ä›\ÅrÎ“\í\îH¬\Ö+­!\ÑnuIô3•JnKVucM\Ê•5(\Å\Êòƒi\Şy\å\Ç\Ú;i\"uÓ½4}­}i\î™w™\á—%UE\Ï\ìcI˜\04ñ\Ø\Õ\r²ù/\ï\Ã\É\ß¿9\è‡nR}®Rø¶F\ç2Ê±\ìL`pyŞ²|{»‘&”\á@Í—tÃ£ˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"ö!]%\ëA§~\Å\Üp\Ëhè—³\ã&g¤­Àc#,\Úgw\î^&)x‰[f\ÃiˆÓº®H„ò¬_£Œ-:øŠ•sÎ…GŸI\Ót³6\çn6m[²\Ü\Îù6Ì•Š\Åz÷»\á\Ç[kªKv÷v8j\Ã\ÕP­MÕœ\ã1š”\\¹¢Õ¯§\Åó\í’ñx\å:%\ã\Ç\Ã^Ja°±„\',\Êó’VŒa)·¥Y+\Ù>=^g)´Í¸´ş~\í¢\"#Fö\îPT©*i(¨.¬U´WvN\Ú^Ö½´½\É¯­¥h®‘T©\ÙøÍ¯\ïC3h$­/‹\â—\îGÉ“NP“‹\Ï;tE¤\äû[\Èü\å6f+	œ\rA]\ë\'Ç»¹iN~l\Óy\Ò:7 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´)\å©.O¬¼øü\îE\É\ZYc‚\ÜT†¹\Í\Ù6‹TJÚ´”•Ÿı£¬Z4–Ô¼\Òu‡8Z-¬CŒµ—^\Ë¬\Ï.eØ²\å×ûˆ·¤k¥V\ï3X™f•8NÍ¨\É-SiIx¦s\ÖaÓ”¤¶}6¯\'¢z+\é\æw\Ã:\ÚQ6›D\éXWµ(\Ó\ã4\ß(õŸ\È\áŸzl¸{W\Ö}QÍ®=“6N‘ùòD\âwŠOô\â—|µ¡G´}\"¼ò\Ã]=³ú,1n\Ê\Ç;Î¾\æ–R¥G\ÒJRµ\ÒOD´]‹CÁµ\æÏ´\Ç\ÖZg”ÿ\04HÉƒ<b4J\Æ-»./\èb5D™ˆe3€\Â(+½dø¾]È“Jp«ò\æ›\Ï.Ã£ˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-œ\ìf a”\Û3 \Ğ\Úq\Ò/¶\íy3\Ç(”½–y\Ì1l\è\'&ß²´ñ5Á\ZÎ­ö›LV\";\Ûxœe:©%\î-ù-L\ç\Û0`ô–ˆşz‘±\àÉ“±\Z£\ê\ï\r\ê©\ËÁe_?Ø¬Ë¿öjò¬LøióL¦\í\Ë=t†¼1q­×µ­¯{pmT\Úk\Ç_õ;ıT\âj\ã)\ÂsŒc\İZJ1R½øß®q\Ş;Eñlöš\ÛI\å§\æ\Û:\ÚñÊ•e/ZR—½&ş§¾l™;v™÷Î«*Òµ\ì\ÄBÃ›`\rlf:xjuªÓŠ”©BU]\ìÒ…š\Ó_e²\ÓuM\Õ\â\â\"g‡ó\å\çûN¿Ui‡u±a.‚Œª¨ô³§NUr«.‘Á9$Ÿ{\è{¾\n\Ög…\ç/’\×\ë):2\ìÑ”\Ô\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ù\Ê\Æb`?j=b¼_÷ğ#g™²\Ç)–…\\wC	5\ë\ÊÑw7\äV\í»oú\\3jö§”~¾	q³ıu\â\'¤usó›“nM¶õm»¶\Ï{\Úö›Zu™[V±X\Ò4ej\â\å¾\çJ\äšÎ±Õ‰ˆ•Zm\ŞR”Ÿ{ı…ò\Úı©óù‘9²¥õKø—›ûV³n„ÎR˜=‡Z¦²]y\Ë\Öò\ïb\ÛeÜ›Fnvöõü¿]soT\å\ç\Ùú§0›=\\sËœ\ì×”xe\Üû>\r\'N)õÏ”tóöªóm\Ùrr\×Hö$KT5P\Ó4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02w7ˆ€+h\Êó}\É/¿Ü‡š~\Ò\Ãf(…\Úü#\çö<\îü\ì\Ó\ß+-—¬£O:˜\0\0\0	]Ú\ëøFMw=Ü»\Üÿ\0+\Â|7—¡ñ‡X{U\0\0\0\Ó}†&SP\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ù½À\Æd\0Š•\ç\'\ŞşZ¯:\ÚV˜£JD\"¶Ç±ı_c\ÏoÎ”ñòN\Ù{\ÑUb\ã-<kşûŠ\Z\Çzbôk `\0/ºÿ\0®ı\É}Qyô\ïSøg\ç\nı\å\è|c\Í\ÖXöŠÀ,À,ñ—3Yy€\0\0\0\0\0\0\0\0\0\0\0\0\0d\ÌÀ´\ÈI;+ò\ÔL‘\Z¹ö\ÈtnÕ¤\æì½ˆ¹÷ñµ\×À¬Ş›5²b‹×­{½q\ßù;\ìù8o\Ã=\í	PiBR\ãR-¥\É)¸¶¼\\~‡›ÍŠqÒ³ÿ\0n~\Z\é	”¼Z\ÓÜ´Œ\è\0\0\Æ\ë~³÷%õ‰yô\ïSøg\ç\nı\ç\è|c\Í\Ö\ÍB\0\0\0\0‹0/LÀ¨\0\0\0\0\0\0\0\0\0\0\0\0’3†@8·hKÁš_³.˜£[\Â„³rûé‰©.‹†¿\âv„•$\Õ\ïN‚wœ\ß%\Ç^Y¹vLQmm~\Ì|\Ñö‹ğ\Ç.©\íç¦£:Q\\#MEx&\Ñ\äwö:\ã¾:×¤WO\É;v\Úm[L÷\Ê¡X€\01ºß®ı\É}b^}û\ÔşùÂ¿yúóu‡³P€\0\0\0\0¢\ÌH¼À\0\0\0\0\0\0\0\0\0\0\0\0,±°Gù£-–¯¤š\\­™\Âp\ÂTmS§8S	±0ôªÎ¼`ºj‘P•IJSE\ìFş¬{m&õ;\Ä\ÌV+ÜkM§YB\ïkü\Ø.PO\ã)~ÇúC?\ï\Ö?\Ç\ÎW[®?ÛŸ’ Y\0\01º\Ïóÿ\0¢_T]\î½\æ|•û\Ë\ĞøÃ®±\ì\Ô%€X€X€X€¼À\0\0\0\0\0\0\0\0\0\0\0¦@\0\0\0\0\ä7ª_»¡ó“û7Î»L~ù\ÊûvÆ˜|eQ¬\0\0\0•İ™ˆ|d¾Wû;Št\Ú\ã\İ(;\Ç\ĞO¾‘\í^|\0\0\0\0\0\0¸À\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\â÷\ÂJ•e*’ŒcUZ\ß‰f¿/YK}\ì¹g?\ÖDk¼:¯wnJ\Î.\ë|Q­\ÂQ~L¡šZ:Ä¬IVŠ\ã(¯$f)i\é5\êm*1\ã8¿vóúk²\å·öù\Zµ*m\Èğ§	I÷\è¾W$W`Ÿ\ï´C\Zº\ïG\ÍV§R­E’\"\â\î£‘v\ãn\ÖzÓ±\á¤M\â>\ÔOY÷)÷KE¢šò\Ó\Í\ØŠ \0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œzR«ù\Øxñ\Ë\n’³¿µ$»=Â£yN¶¬{\×;²>Í§\Û)Yû<5vm}J\É\Ö;\Öj^?\Ãñ°\Ò}aŸ’Šò\Íşk\\\Ïóİ ªnZ6ûl»/n	\r\"¼Ç£z,‘[ù¿\íÄ¹İ½‹{ü”»Ï·_w›¶,U \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ò¿Hõ±¶mõ)S2—ú‘G¼&~»—ªÛº4\Ã\ã.ZS¾‹E\Ë\îù¢;Ó–™\0\0zO¢\éŞ\æGÏ¨µ-·diKG·\ÉM¼ûu÷;b\ÉX\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0OnnL1U§YÖ©S.Š”VX(\éğ \æØ£-\æ\Ú\Ê~\r¾qR)\Ã\Ñ?FË³ü\è¯ù¦\Çu¾Ñ½\'¾¿8ú6•\Õñ	\Æ\ë5¨µ,½¶y¸˜ş›:ö¾»iŞ‘§g\ãû.«\è\İ\æy1úªT³I.ö¤“ø	İ¼ù[\à\ÄoN\\\ë\Ï\Ş/FÏ·¼¨\ì\Ìn\ßòø~\çõOñøşÎ—u·}`c8ª§I%&\Ü-ekqdÍŸgú˜˜\×]P¶¦s\ÌNšhœ$#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(22,'root',NULL,'root@sunilos.com','2024-10-01 02:00:10.084000',0,NULL,'Profile picture',NULL,'images (3).jpeg','/User/profilePic/71',NULL,'image/jpeg',71,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\Z\Z\Z(!\Z%!1\"%)+../5D3,7(-.+\n\n\n\r-% %--.//+--+555---/-----------/----------------------ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0J\0	\0\0\0\0!1AQaq\"2‘#BRbr‚²3CScs’¡±Á$45ğtƒ¢\Â\Ññ%6“´ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0&\0\0\0\0\0\0\0\0!12AQ\"3qB¡ÿ\Ú\0\0\0?\0¼Q|\É h.q\0\rI&À¤•_qlXM),\î©x\å£ş#ˆif\è,4T‡ş †oòó–ûúF¶¾ö\î­{r¿½aq‡nrHÁ¡$zò\È\\\ÑcA-û\Æû\ì7A~\"ó\îÛD4±D\è}\" gšG‚s¸´0kf\Ø^\ãeköm\ÅNÄ¨\ÅL‚É™Á\Ñ\Æü\Ù@q\r\Ì\ÒIi ^\Çqc\Í­Eudp\Æù¥plq´¹\Î;rWz¥\Ú#Š²²<.#«\í,\Öú ü››†cö[\Õy\Ú\'h•Xœhs£¥Ô€\\£¤·´ı¶¹“\nD@DD±À1Êš)›SK!dé³‡6¸læ…k‘­û<\ãx1Z~ñ–dÌ°–+\ê\ÓÈ¬:\ØùJV¼k\Â\\E>RÊ¸¬\İÛ›=‡\Úc¼ğ K\×<=Œ\Ã[O\\ì•·A\Ù\Í?Y¦\àø„D@DDD@DDD@DDD@DDD@DD¸|tğ\ÉQ)³\"c\ãõZ	6Î›/ñ1%eL\ÕrûR¼º\Û\å5 ôk@hò^\í\×\ÒNöÓ´¹¥\í\ïˆİ±73\Éò\Ì\Ö_Áy\ÑşÎœF[,\ØsÏªñ\ßG~Nm„€y¶\Ç\îª—R\Ïq?FÄ©\'\Ø	Z\×É¼ş\ëŠ`¢\"\" \"\"\" \"\"\" \"\"\" \"\"\" v†MU‡T\ÓÓ€e’;4\ÍÁ\Ës ¸k¦«\É-<¯‚vH\Ãg4\Ú\à\ï\ËE\ìüFº(\"|ó<28\Ú\\\ç€\ëaºòOhâ¦ºz\È\Ãû©LnsKs5¡­¸¿»\â‚8ŠaÀ<>&\ç:ı\Ô¸2‘{º\Ú1£™\Úı¸5TIZ\Ü?.YŒ\Ñf}gª\0.¸\ä7Ôµ³qœ*jYŸO;r\È\Ãb9›H\Ô„º\àˆ³ñ<\Z¦œ0\Ï\ã´=…\ÃG4€Amˆ\Ópƒr\ZNƒUÂ·;\à\n\ïJ¦\Ä\ä`¹\Ò\â3<9­-`\ÖÄº÷6\Ğy ½xv©ò\ÒS\Ë+K^ø£s\ÚEˆs˜\Ò\àA\ÛRV\ÅDûV tøMdm½\Ä}æŸ«se#\àÂª®7lU´¸4®6‰\î†\'e·ª\Z\Ù@6ĞƒWû\Ø-\"\à‹\Ô\ÂóQº–š¿\nq9¨fª˜\Ì‘­\Ğı^ğz¹\İ‹G©z¬û…«Œa5q\Ó\Å$ı\Ñö$ff9–>­\ì\â5Ô›\\{\Ş*Ù±ZjƒWSƒÁQ.\\¦¢•öyn\ŞÃ³l-{\r4\ÙXô³‰\É\Ïk\\<œ\ÍV=²¿Rz	¨\rõ¿#ŸY36Á\áºmkfú\Ş*µ\'s¥‹Æ£lŒk\r§\â$,†zjºk5¦x\Ë5 ¸1\Ä_3Å§[X\ÙÑ\ÉxJóWEˆÓ\Ö\Ä\"xX¼8\í®2Ğƒ±Wu9~F\ç¶k\Ö\Û5µ·½s\ÌÛµ\Ö\ÑÍ¸6¸½œ9\\TıIˆ\Ô;ú{\Ë\Ê|[„CKP\è\é\ê#¨„\ê\Éö¸ô_—g\ßÀ^xa˜“cÃ»©&\Ø\Í	\îc\î\ã«OCa\çrg\Ó6‚\Z:F\Ãv³(§‹1\Í\É\ŞeÍ¡\èma²·jglQºGh\Ø\Ú\ç€4€^ò[¨x¥}¨Š\n£’£]´ôm±0’~Q±»W<›\åi\Åö\Ö\ê\ìªB\ì&ŒŸ\Ñ\îpÀK\à‘MQMM‡±\ÄMŠ\Í$\Ó8[\0®\ërº$u\Ê\á\Íz.‚8bd17+#kX\Öôk@\0|»ûCm}2zyW«p(­Õ\Êè§Š\Zl.&Œ5\Ï\îœ.-®\Ç[_c¥¬5Ãš±\ÔN\Îk\Øe#Á½¢kœwŒş#P.\Ì	¦}nó\ëRL\çF\æ,XGó?´\n[\ã0\Ñ\Âj*›KA!¥\Ö\ÌCFƒ•Ê£zÏ–—)hñ\Û` 8;½ª\Ú6º6O\ê\èÁhñü¡òN)j™,m–5\ìp»\\\Óv‘\ËP¢¸\'	\Ôzk±\Zùû\é[°1¢Ì‰¸\Ğu\ÊH÷÷Jõ½»nõ¤ \Ğ\Ã\Ş÷ı\Ü}\î\\½\îF\çË¾\\ö¾_¨\Çk‘‡\r™­\Õóå»Œ†\Î\0\r\Î@õ/P\\E¿\Ú\å5 \Ö\ZúL\İ;\Ón\é§\Ä]†\İº.\â+C\ÎI\Õ[N\Î;>}\ÍET\Âiû¶\ÂÌ­³b‰ z­\êI\çÏ©SôEuPDDD@DDD@DDD@DDD@DDEÃœ\0$\0Ü”¢‚qjøe11\Â÷U\Í\Ê:qœ_\ÆOg\àIğUgq\î)Y §œš%\Ñ\Æ}gGÍ½÷\ÓA¨¸\Ô.\Åf}92\ß\ãòbø¬\Ó\ÒH\êXi‡¢¾¦78I1—4X€\0:_¥·\0fM\Ù\Ã\Ò\Ï\íG+k§t Œ¶#Á|ö1h ZY	ñ>¨ş@|\ésN\í \ì\åô\í\ÉM‰V\Â\Âo•°¾€›4}Áb\â8#a{Y>=W®±`|ö\ç¡,Íµú‘uc*—û7­ª®}LÌ—)9\ÜZXCClt7\Zin»hšƒr’as-$u°bk\æ¢\r,x\ï\ÚñòB\Ã\ç\\¶\ärv¾\É&O\Ù\nø©][QcQ^\ïH‘\ßU\×14¤›r\ÎG%^\Òp<ø¸£ª¼­†‚=n[™\ìÅ˜\ë}‰ _¦öY\\+\ÚX\Â\ã~Q•n¦ydrÀZæ˜¯qs}okr\ÛLºø­b-1v™˜¯$Q>\í®³bœ2S§s-™%ú\0Mœ~\É*X½¼ˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ\âYZÖ—<†´—\0™$\ì\'ŒûL¥¢y¦…¦ª¯ô1\ì\Óú\Ç\ì\ß!s\Ô\0n«Q\Õø‰ÏŠNrn)b%±7\íXœ\ÇÌ“â¤¦;_\ÓÍ­\í=\â.\×)˜\ã«f9ºB\ß\'?v‡\é(&(1@\æ\Ä\êIf\âš²!\Ì^\Ş×™¹ñYt´\Ñ\ÆÜ‘µ­h\ä‡şWj»‹X\îİ¡¶YŸLz*¡acX<§\Ì\î}\ë\ç\Ãb¨aŠQpv<\Úyy”Yñk]\"\Ü\ïmcGÿ\0n\Ëôf”~ıT\å@»ÿ\0PŞ•rş”õc.>e‘­\Î!­\0’I\0\05$“°X¸n-MP	§š)r\ï‘\íu¼À:-wa\ÒTPTCó¹—h¸µÁù~ö[{\Ôc	\ášZú(kğ¢\ÚJ\È\Ú\Z]³{Ö9Yµ½\í¨p½Æ‹Í­öõZùzG»Eˆ¿‘½\ã\ãi¦`~Ge\Ì\Û\ê\×¢t$G\é\Zd>@\Ğ\ÖşrnC\È\î]ş‡Q›]Ÿ\Ä^\Ú\è±\Ä\Ö\Ë6\ì-¸AÍ¡ò$j¥4\Ôì¡‘´5£`‡şU\î>?*\ïşı \ÉmKS\nRû·31Ü¼“œ¹‡ò\Ùg\áµxµ\r½\nµ\ÒF?1S\ë¶\İ·hğnU˜ŠÍ°RÑ­\"Œ–„íp‹§}+‚f\İğŸ†­òõ¼Õ—EY\Ìl°½’1\Â\í{\Ò<\ÑQò\Æ\×4µ\à8Á\Ì® ¯yŸ\n—-õ}3\ÉtR{‰>7\Ä*™8³×´\Õ\Ë\í\è„P\î\í\n›¼.\n¦ût\ï:ø–\í7øœ\Ì\ÅTJ\"\"\" \"\"\" \"\"ªûO\ãYÌ§	\Ã]–[QP\äš~cHù\ä¯+‹kr\Ù\çc¡£­\Ö=\Ó	h?9\çÕ¾÷\ÃTlFYItÓ“,®;—8—kñø’¦Á‹õ-¯§‹\Û\ÆøV;r\Æ5>\ÓÎ®q\êOôYÈ‹R\"\"5\n³;uÁ\r?\0bØ€}U&O¤O$®|\ÊÖ‚C\0µÆ§/_vŠZ\Î9’\â,^’JB\ãf\Ì>R¶İ¼†o(w\áu\Í\ïñ,9\í2¶¢hŸO&Œ–;1\à\ÉÙÌZ‹X\Ïğ\Ş>¢¨&ˆ\Ò\Ì\á•\ĞT4wn\å£\Ü2yfü®°rZ\Ñmë¦+Y}¤Tµ,‘¢H×±Ú‡4‚‘\Z(^7A>PüR¹\â~µt£g\ro+\'’zjv%d\Öğ\Ô\Ï5$ıÁv®¦—@ı¶½\ËM¼üB\È\á¾-\ï¥4U±z5cw‰\Æ\íxµóF\ëú\Â\×6¹\Óbu²-[Ã“[R_<G\Ãôø\Å<Uô2T\Ş¶½¯x¥/q\Î\Æû‚A‡`\Õ\ï>9™\İ\Ï‹%gGcÀ\Øü9\î¥ı\ÖA·uY3@\è,À\0…ÁQŒv.\ë\Z¬a\ĞMR·\Æ\Ík]ÿ\06e/$\×/‡ÓœŠE©\çö\ÉDE² \"/—¼\0\\H\0’v\0nJWdöx&9YbÉ™£\ÚA¸7$®şVS\í\"F\Ê\Ü?³d:CU³%\äù5ûk\Îú\ØØº/G] ˜¤k\í¾R\rº]|bx|u˜¥cÍ§“\ê«\åÁ\\‘¸ö–—šõ/@\"­{ \â™dau\ÍQLc\ÎòÃ iñ-¸\èF\ä¬¥›1®¥dDEÀDDD@DD7n5¦Y(°\Æ\í#\ÌÒ©t7½¡h\Ê\è\Æk}/­¨İZš?¹ùK}ğ\ã÷—yZ\\J\ê›ü«eô\"\"²ˆDD­Š„\Ö\â\á\î™ğDct®, >B	\ZO€¿=‡E²ZüWes^\è\åŒ\Ş9XHsO6Qg¥­IŠûIb-¹ngÀjğ;\ÏFdª¢.\Í<\r2²\à+\\\Ğ3hôå¨·¬$QÉ†\â\Ğ~n¢>‡ÛŒ‘û\Ìwˆ·½E¸cµ*ˆ\Ú\æ\âP>H\ây\Õp³@\à@ùV\r÷¸·‘\Õnd\áL3şı…\Ôz<ß¦¦6\Ô\ëia\Ò\Ä\îGªO;¬O;S«¯\Íb\İÕ®i°)Yy$›‘\ÙHw¬\êgˆ<\Ù\ä:\é{f—ñAˆ\ÂÓ›$¬³ ¨aõ˜}¦\á»	±µüEªV\âô°K!F\Êø\\\×7¿†ã‘±•m\Æ\ÃPº’¥•\á\ÕPañ2ªLù€|m±¼q¹­pÄ€n	:r½¶µ¼d\×Ê¯X÷ñ—Ofx-E=A­iI<’=ù\Úñ °´Ë°\'6‡^z\\¬\í“a¥Š\Âjg²\ÎúQ½\ÙK†gûÃš°¢¸¸‘cmv#ª\Ğv‰…:§\r©‚1\ëdkG3› h9m\ïQVó\çIjÇ†`n.9\ê¹X8`š96€|4pø…œ¾³¸\ÛcR.A\ÒË•\Â\ëŒ\Z€\Â\Â\"$’c``\"ş­À\æ\Ï_,x Ab\rÁ÷¯¥\Ê\ÄDj–ºZ\ßC®¢\Äd‚)O\êŸpIğ\0¸ù\Ùzy\ã‰){\ÚYYmr—6ú\Ãù[Ş®~\0\Å}+¥¨&\îtM=^Ñ‘ÿ\0ó4¬\îUu}şVqN\ê\"\"¬DDD@Z\Î%\ÅE%$õNü\ÔoxH(÷›zÙªÇ·zó\è\Ğa\ì>µ\\\Í«Œ‡8ûûŠDl@8Nœ²™v¯”™\\y’ıA>\ë-\Â\á­\0\06\Z%\ÊÙ¥|k¥3¹Ø‹P\Úùq§q{E…\îc¯>·]­¢Iˆº\àˆˆ5\Ø^\'>Q<‚TSÔ–¹\íg¶\Ç\0A9yƒsü5\×]ŒbøS\ß\ÑEˆRU’{¦¶0\ç`CÈµù6\×R%¯\Çh<YX\ì²5\Í|n\èö\íıB§—‹¹ªzeú–Ó†x\Ã‰ÍŠ»¨œ~‘±H\írm‘Ö¸ú>%Z—~r,2\ÛC\Î\êÁ\\u-Lşƒ[\0Š~\ì¼=®’›8óN\æ\×;”\Ú\"û»0¾–\é\â°ò\Ä\Ä\êcM,s¸\ÜNİˆˆ£H¤ ¥µõ´6³Dôca’@\r‡€£\â¶kuÚ—Jì˜#sMN\Ò$ô\êHóm\Éò=@\n;‡V²x\Û,~Ë‡¼`ø‚·ø9¢øü~\á•\È\Ç5¶\Ù¢¸ü”Ÿaÿ\0„®õ‹‰Ÿ‘—öoü%\\·©A\Ø ?¹\Ã\ä\ï\Æ\å¹Z\İ!û\'ñ¶^qü#úv\Ş\åÁT£°j\Ï\îµDúÔµh\Ã«O½\ÂEY=›\Öú62øI³+a¸ñ–-@ı\Ğÿ\0\Ş\n¿.»¬JL3Ş—b\",õQ<_]\é˜\Ô\Ïñ\Ñ0@\İt\ï\rÌ„r¸%\í?d+‰±v\Ñ\ÒOVı¢cn®µš\ß{¬=\ê…\ájw6$„™&q•\ä\î\\ın}\Ö>ò§\ãS\Êÿ\0\Ò<“ª·ˆµQ\î\"ù:šJA\æ7y<XÔ¤%jxªŒ\ËK#[\í4go›u\Ó\Æ\×õ•„V	¡_¤\Ñµ³‡\Äz¼\Çç·¹\î°\ÌDE+ÀˆˆˆƒS‹\É-<°b073\éœK™ô£p³\Åü‰ı\ây+“Å «…•\ï\ãC\Ìmp\ä\á\Ì*\Åj\é!ª¡\Ôa\r\ÖJg~IşCæŸ‡˜\Z,\îor~úû[\ã\çğ\êW‚(	Ú•\Ö5ôst—òd\ë\ì\Ë\ÓM\Ü\0ñ*v\rõÔµgS\r\Z\Ú-\éÊ¦¸³şÊ«\ïX-CT\î[C/1\Ğ4\î<.>n·*\Ã\Æ0¸j¡}4\í\Í‚\ÄA\ä\àlA\ê˜r\Î+yC\Æ\\qz\éW¬<aÖ§˜ş®OÀV-<3P\Ô;ª7-\Ö	yI¶ûÃ§…û8ö¥œş­\Ã\â-ıW\ÑFH¾?(ü2f³[j_<0-I\ØÌ­¢ÀÀYjh\ê\ÙüZ\n\Ï^\éñ‡-\ìZ~!™\Ğ+£¾zYY&œÛ˜7\È\Ø\áu¸]5´\ÂX\ß\Ù\í-ø‹]s%|«0Vu;^Ô•\r‘Œ•†\í{CšzµÀ~v¨\'b¸¡Ÿ‰>½;Ÿ¼2°{˜\ær¬uÁM\Û\Ö.Ü”¸qxhA$¤\0‰‡@I\ê\ãq\ã\ZÑ´i·/%õ\Ûvc\Ä`ª–6\ÔG<]\Ãb\å˜\â\ç²\×>\Ğ\Ô}\"4\ÒğüÀ$o£U¹Œ¿­M.şM\Ìt>WóVø×Šÿ\0´9ciu‘jcô¸ˆ´\İä¤—\\4E–\Ü\ér²k±h!sY+\Ã\Å\Å\ïm:»a\ïW¼\ã]ô‡LŠ™\Û#ı–‚O*!À8\ß,&\íõ\ãg&‹œÀ\à[ğ%nñh[\é¨!p&®F‚\æmNgº\ãM¿t¬.Ğ°\ÃM‹U>¹}°H\Æ\r»¡l{|€ş\0ª¹r\ë,k\é-)ûgi1E\ÕM;dcdn\Ïhpò\"\áv«‘;B\"\"8\"\"\" è­£f\åhsO^^ ò>+w\ÙV<\æa.¼Œ\Ğ8şr£¯6ô\éqóV­jñ\ÚIJšb[QNs\Æá¹¶¥‡¨=9\íÌªœ¾?\êÓ¯iğeğ²ğE¦\á!¾–:¨\ì´{¾I\0˜~  ƒ\ÍnW\ÏLjtÖ‰\Ú;\Æü)#v\ã’X\Îhf±şc\\¦\Â\ãÀÀT¯V\Ô6\'\áõq–Ufcvõdn`C\ÚF–6ò\×\ÌF-/ğµ.!wP\Í[|’7G°õk¾\Z\r•Œ‹c\Ü}J¸bıı«¸\ã\rhhÙ \î_K\Ãq3üKMU0Ú¦0s4~µš‘\æM¾±\Ùw\ĞWE3s\Äö¸xn<\Ü5½‹52G\í–eñÚ³\Û!\"™k\Ø\İ_uˆW\Ñ¤©`\å¾Y÷½£î«Px%_£c43\ŞÍ›=;\Ï\Ú&?}\Íø+ñdf¯\æ);¬ˆ£zÌ\0€¹ò+\ïM\â^u‹\r…±·_\ÏJ.M¼‹Áñ`[\Üw„púËššx\Ş\ãóÀ-‡\Ê2\Î÷e\ìˆ)\ê+\íVT\Ë/\İ\Í`=\Î\ÏñSµO-§Ï¥¼uÕ­We.Z\n\é\â£”	Y\ä6°÷\â,¦t0T\ÅIW\é\î\âkn\çiôÀ\r\Ükez(Gó\Âb\äÁQ)ÿ\0\ë\ĞüX¦\Ã\ÈÉ¿ô.*kzkû \à)©ê¥¯ª¦ôk7$0—‡]nñ÷¹¶‚\Ã\í9jx­ù±\ÚÏ©,ø±W² ñWf\Æq7tt-øFı*\æòB®OŒ»\Ñ\n-UA‹*·½7ô:¢0\åŸ6O½üº5] ƒ¨\æ©\Ú\ÊVJ\ÇE »\\,Gõó_r\Ùök\ÄÏ\ã­v£ü,§g³”Dı!\Ë\áôo\Ï\ãj|\ê\Ğ\â\æÿ\0Yèˆ²\×B ¼KÙ¥4\Î3\Ñ;\Ñ*7\Ì\ÏÉ»Áñş­ºT\éª\Şk;‡-X·µ[‹ODÿ\0GÄ¡{eù®Œ2Q{ff£ırD‹‹(\É\Êç¹‡£\Ø\áo;^\Ê\à\â¾‚¾\Ôó\rõcÀõ£\'7ş\ÜÆŠ½\í‡,\ïe\î\Üas\Ş/\Ì\È\Ægxœ„ûÖ}\çU•,œh\ËA\Ä\Ï\ÏL* p.…ì™i]§{—¿¹z\ÄQUû2±’\'4:\Şz¯,\âxtp±ò\Ä÷EpAh7k\ïq”´\ï{ù+û±ú\Z˜0¨#ªw¬\æ4\ß3cq\ÎÀ\ë\ìu:r\n^Nü»ö‹¤\Ñt‚\Ã\Æ\Ã\Íû9?DA_ö=şQMÿ\0ÿ\0\Ñ*™¢*>R»OŒ\nUÿ\0\È\è¿\İ%şr¢/x~O9¾+5P\æø§\ícü.DZ|\ä…ŸeDZŠ‚\" \"\"\" \"\"\0Q®2ö\é?l?›W \äÿ\0¤\Çò‡ Š\"/š–Èˆ‹€«~\Ü\ÃR½3ğ=Kƒù!\ã/\ÂU¦?\í\ÓşÙ¿\Ì/U®Qjr?’T1üDDP=¿ÿ\Ù'),(26,'root@sunilos.com','2024-10-03 11:28:17.467000','root@sunilos.com','2024-10-03 11:28:17.467000',0,'root','Profile picture',NULL,'images (1).png','/User/profilePic/87',NULL,'image/png',87,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\Æ\0\0\0ş\0\0\0VlŠ¯\0\0\éPLTEÿÿÿüĞµ333\n\n\n]Á\ÛCCC\0\0\0ù¯€ş\îtÿ\â555•ÁüÒ¸ù­}ı³ƒ????ó:::\å\å\å!!!\Ë\Ë\Ë&&&---ÿ\ïq$$$ÿ\å\030/ÿ×»O¾\à3)&\ìf]<±\Ë\Ó\Ó\ÓûË­ÿñmöööûÄ¢\Ğ\Ğ\Ğ3+)\àd.\0\0ú¾™¬¬¬\ëo\ïÀ¥\0\Èõ\ìz———3% aI<ú¹ƒƒƒccc¼¼¼K·\ÑWWWœ_G(\0\0\Ğ\à˜qqqŸŸŸ2Zc1¶3FLC4,¼iG\ÂlFX7&£lT!\0\0•.\0\ç\Ó\ÊÁƒdİ¨‹¿€_Øµ¥­W33RZ2|2ky2‘¥2…˜ƒ]J\Ò~U¾gBT@6wXG¦‚m4\0\05\0±jOøº¥\ã\ÌÁš¹ÀÓ£cÈ•|ÿ\ìLĞ—y–Ï¾\0t¡k\Ä\Ô\è\ç†\Ö\íñ¤ÀvÎ ‹\ÅuT]G„T@®M&\0\0·’|›xcH&º¢–Œ~w;W6%ü\ç\Ûò –üñ\ç÷\Ë\Åñƒ\îxm¶X-\ïs©R:€’˜w©¸Û €Â†_¯Ğ—–Ê¥n£¬\Ù\Ñ~\î\Õtß¾qnµª\Ï\Ïh\ê\ÆSô\×H5•šl¢–­e\í\ÍO;¦Ì¨\Õß€£p¹ºE\Ì\È7©²S\â\Ñ!\êöû<›¨XƒŠ\Ì\Äušm•§\\\ÃÀCZ5Àx\0\0 \0IDATxœÕûCW¾À!‰y y@ ²!Q$ZÁ¤(‰‰€$¤·).R¨¥,mo\ëº\Ôë¶º\Ú{ow·\íbkµ¶Û¿ô~¿\ç1sf2’ûı¡E2™ù~\Î÷yÎœšš\ê!i¼.>\\é’œ\Òeúc\ç\å\Ëcu\Õ\å\rdH²Z%\Ô>|^¹Po}(\ç#\0ø~œª·B“)‰*\ï&\Ô0\r(ao\çÔ•ñ\Ë\ç/¸»¨ô´^¸<9~e¬\Ó\ë%\Èh\ÉIF!…\ë¬o™„\Æ&/ø¤\nbõŸŸœ\Z\0g€S4–O\r\\9\ßEUu±Z¯§K‘Ÿ\'`e0ŠHRg½W\Å;vXQÿ€§\Ë\ï·\È\Æbñwù€†pZ!ñ6ŒGy\Çı„\0¬C>¦¿\Å\\\È\Ç]€\Ó	.6>\Õ\Ş+~\â$€\à\é²\ì e\âc­c\Ş:CœºL¬.\ÕT:\Ü2°ø}„\äB=m2f¡\Ñ\03¸;P¯}ˆ\Ü\Ú\Ú\áF«ø©M&\ëc’ğ81„\è±\È­­ûc öh¥_“\å®\0‚œ8zŠ+\átzü²†uÿ(ğMú]0\É¼t\áˆAÆ†Ğ›¬>‹\rq ¹U±xdòc¤Ó–°ö\á\ÜBv#¬\"Dn%¸¹rD\Ø]D—\\´@DF#+\á C\àªò‘x\ÖğUa‰>AŒÌ‚\Ú\nûU9\ÂoEÏª9˜‚\ÂS¢od¤¿D™™¹u\ä\ÖÕ™w_?ü\nq\ä2şƒ›X\Î\ÕS\ã\ä;…¦ø\İ|ôúû\å[ó‹‰D\"$J\"±x{\á\ê\Ì° J«‘0\Ï\Â\ì[\Ó)\Èe¬]r‡‰)@Ç™…Û¨şôôt‹^\àw@³8«QÊŒ¢\Ä\"wA=<_³”\å\íASXTS\Èb\Í9\'/,B¹ş:˜Phqa\æ\Z\ÅÀ&4B,!r8ˆCõ(¦@\ÇP(úúaO¬²0Ó\ŞUnrN§^§jA1S\Zx%Y,{##W«gPH¯ŒXL\âf)«&2)9%¼6ˆ\Ü#}‰ı1p’Ä‚Aô&\éP8}Q\î‰mz\Ã \æÁ@\æ\rA”Œu¸$Ám¥\å¦\å\Ê\Ís@ŒJ(4?¢\é\Ä	\ë)¼>	2Uß­ú/öUsˆi’`¹L¥`\n’XÀ`\ç]	»‚è‡·¤\è\rH\Î!J\Ñ!–¥f\ÑĞH}€j7?¿°\05Jù\Â\Âüü\í\Å­(e‡‡gú-j°S{³\nrx~\Üú„z=_An\Ï_±`\ï12\Â:*ø	ªû¹÷\Ì\Õyƒ\Ú2š\'\áı®\Ú\êG\Ø/I=\åı·\Êü	“\èüU÷9\Ú;÷*Ø¬\ĞJ¯A	%fF,Šguÿ³\Ä{8\á.\É\ÙUNqnA«˜!q{A&SHvc\ßunFW-§C\ç,ŠA\Üd†K9z¥~´JR—[O\Ñ\×w[c\nÌœ·Fú5FóZr\"æ’ºº?ºM¿/3·Àñ\Æõ¦H=e#3¢C†23\È=z ™¹Œ\ĞÁ¸\Å\ÂJ\È}\n¬,p@¾z\Ã\Æ}Üˆ¢ÿª\à¤©\è/s%\Ùg\æ©ø¿VqZ3õœ»u;Ä‡dšÁ¥4\ï$\ßõ‰0\Óó•Qa†p—3ôp#pd¹Uƒ!s“\Ìs\é\Ğ-•Ã¢rX¬oT>$P¦\Ìó!ba\Ä0¦q\n\×\Ã\ÔeE\0ôj1dO—\ÌM\Ò\Ç[\é³‡¥ƒ8\ãı\Î7h¯Â’(£87¯]\âjÿˆª¹0÷€lou2-eª¹`SvLÔ¥|c\Ä\Â,¢\Ø­§:$–\ß?€v\Ğ\"öl\"”Ş«¢7u(ú¡8%\É\é\ç\ê\à\'²n0P3§\äW\Éûİ·‰«Šô¿4\Ì=R\à€\á1ªˆ²@\îtNô&a˜\ášVi«(	Ÿ¸Ec°¦\Å\êdv$®…­\rsvb·[\ä8hxtJ\ëi\Õ\Ë3\nhúTw²ğ5\ZşOŸ´œœ4>Õª.€pøNğYjHò»¾s‰i\äp÷ñóR;\Óğ8\ØB\\\ØJ“T\Ó)úB´P¹û\éuÈ…x\nR–J$g)w\å[\êSn¥©TòK%ª?\Èh\é„0DÄlpR=\Î\Óğî°¨:\\\rº\ÅüI&\è\à)ˆ{‹GZ*”¬>–l$ø„B™ùú¥ş\'$_X§\é\ÇdZ<§\å n,û¦£\á\ífnúö\ÍÀ%”f”¹•¯\Ô(\êùJ‘’4$³¡\Ä\å\'D\Ñ\ä)\â%Ë¹Y4_´\Ò\äÔ\r\\CÄ©\Ó \ëzi\'\å\æ½3§<L¡\\*U–À©\è,¯~j`\ë|\nr\èr!‰¾G§\Æ4 A e…f4Õˆ&-œ\îÓ­.º\'s=Hx/N¦°°\å*5ñĞ•ú“\È,\ÌP4²\Öó\ÆD*¿Ä½ŠE¹\Ğ\ÌYt\áA¿f•Z÷EA]Š\Õ\ê	¢)¨‚r¹1|`W~‹YC©H©\Ôj%Å«˜\ß\áG\Øy\êİŠÛ¹¯­\0P¾ı4›[øµû\Ü\ĞŠ³!™\Çn‡F?\È\ï¥(bô¨n©\r\rŒØ­¼+Ù¸UI½r\"tK\ëV\ì\ä}`\\\Öôu4\×.òy\r²R%+U…û<nÁ\åg¡N\ÅÂ—Íƒ\ÄõkP\ébÄ•š°\Êü\æ¤+e­bd1¡1‡…®R÷8÷1\0—”eY\êªö¼|ø´\Î>cŒÃ¢b¨\Ø~\ÉZr\à²j3\îUt,]\Ë\Éj¹³ú(w+M›,h¨=-	p=Y\ã,\à*¥¨Mµ†\Ì|^Vg§\ìÀ.\éZ\Òe‹\\”xq»I\ê\æÁ£oœ\Ù\ÊYõ\ÊÕ˜\à\ç\ê\Ğø\ÆÈ­4*,âº•…\ä)—Mµ]\Z \ÙB\áÅ”\Ë¥\îV¥²˜\Şû¡_uZ«\ÑJj\çI\ÇYö—ŸT\ÉOšÔ´‰\Åh0øWT+zŸ\rR¿Ø¡C–¡j“\î¸\ßl¹Höœ®•‡„\æ\Ú0‰X\ÊS«R7d¥\ç\Ö\Ôp+xÇ°ğºÁZx\íu»À\Õ\Ì< \Ùj†(º\Ê\Ï\é\æ>¥\\p•‹›\r®Š¡¤}\ÃGBCÁ \ç’IÿH1|f¬VI®cRR\Î@<B\îR\"ERN\ÖAóh\ÃP N0œÊø_Î®`X‰\Ùj©\ÖeÁj\Â!{ª\Úb\é\å\×\ç\çöK~\å\êGº<ªjY\Ôf³A3\âô³\à w¦Ø·\çƒ\ÙTI8ğ¢“\ÇI¯\ÈT14‰W\ím\Ë\Â\×1ı\ÉV¥v©\åÄ¢Í£j¿\çô\ä\\ˆqQ\âK\nb\æ‘U»\Â\Ì\ÊE\Ì\à\Î×µZ)€~É©ú²\Æ2\Î*\Ì!\Zƒø²O«5 q7_„ªó­\ró¨\Óc°?OÕ…\ä)›+Uôğy‰›´üd`W\'s\Ù#D¼\0Œ½&¢1°\áô«m‰Ç©Å€$Õ¡üÈ….¸<ŒYW\Ï\ça\âóùºpÿ!Û€\ès’<es–™Çœ,»\Ù\Â\ÕV1¾_[¬€Ö½’•h\âSC\Ü\è\ÍZ²h\áA¬Å°%dó¤“\ï\ït:\Õİ =~è¸‹<\ÎQ\nğ1£7wù\n™\\8ùõTÏ¦Áaİ£”Oª5\İŒ¡œ) MH\"Fk\×0Mò\ßÊ´ˆ\Ã(\'ûV3A\Z©Á\Ã0\Âu\î\ÆW\ã|\çf%\ŞAz\Â\Ï\\¹³jª\nºó8ƒòœV1¨³«»Ù¾T¿¿«\Ç\éaË•¶K\Ø\ÛHh \Ñ>\n¶kyñ‘ıÂ¥e‚Q©Ñ½\Âg\ĞD»\Ö¿“»\'\Øxö¢p®¥D€O\0Ç˜(H®«°´\\,.mm\Ín]d¤XœX\î·\ÎFˆO%=’“Ù‡²¨ƒ\Ø%%KCJ¤Z\ÕI&­´!\Ü\'®\ãÁ\ß\ãT|¼\åO\â\È¡\ËCö®\âö!\Ézmb\é\âW$tó…T*!%B~\Ì\çS©B²DÒ²+?[¼\à›¤q²O\Ù>\n¥\í%ªr@\ÕÚª\Ê\Ûó§$«\à¤0\àNó\à¤\Å\í%ƒ@ø}¶µY’†€ ”L\å#H\Z*b…ÿ\Î\á ÿŒ\æS\É\ÒÅ­b?İLP„8•4›/x¿\ïs*¹\ë8`øM1.H=b¬¹»4>u¿¨µ†\ÏJ.\Í’ Pµv€¦†b\Óc9\"\È2[ô((„¢z6R˜`+ûN\î_\Ã<\çz\Å\0Ç”\á2^ ”R3\Ùq\Ê<i™\"\Ø\Ó5l&?\Æ\ãq›X¢ùBò\âÒ„•‘H.¸­|d‹÷4ø¼Š2Á¤Ç˜\å\ÜI\Ó\È«r\ëAj™\r‚2Ml•\0ÁAP9\Ô~°\ÙN¤¹L\Ø\ïi4NWQ€BBü4€ó\Û\ÇVBQgNÉ˜\",IbG.»ıš\Ğ\È3²?<\ÅY0C” 0P®½1O3Ñ¢DR@\â£!\íJJñ*(\ê,È™S™5VSB\çGG\r+²P€\ãÁ:\ÄŒ J\0\r°\Ä³ I!9;&A2o!\é‰a†ñ‚¤‚«V8\\‰…!˜\r\å—!ıùHuXF_bñ\Ñˆ†¡(*	x\×8\×lª<+\"z»ñ#+°•/‚ËªIœV^\Él(?!‘€\è_\Ò1A`u	$Q\0Á\é(a€¯_U`F÷;Æ‰OÁ\á\Êê€ã¬¤#_”œÄ™R$À•†›…A!A£( ©®‘\Ş\ê\0i‰s\à]*†a4{\"m£45Ne\â\"c\ã\Zù“\Ô†€¼„vpÃ¡!($ÍƒqnW4G{3´‡‡`\ÕX¢\"\åÛ§${Ymò!!(óÈ·Wdv‹\Z.¾t\Øep”\Ç	N«’´QBJhö‡“8iÄ©‘‚\à1!†«O\\\Z\"~8ñ@$¢\Å$ùÒ„úT\Z	¿:|e>¬—]\Äƒı(\ã\ã.\Ò4\Ö4\"Ó™‚±w‹\Å\Ïbz¸\Â0s.W$·¤>^©”§[c¯:‡zˆ\×qXƒ¶°\Ãq-\r1|ˆA\İlÿ\ìú\'\×\ß>}z³Œƒ8q9\n³>\Î\á$SiCmR!\æqMn[w‘*Eœ\n½I\Ê`l\Ğ\àúû‰O>\Å>}\çô\é˜!dó(I\\\àXË‚cYE}ô«>\ŞSÒ‰\éşJq7½{üúõwŒ²J	.½‡\î¾{ı\ã³\Ø\í\Ã\âŠ$!\×;ùÃ¨\Zmô\nŸT„Àj—Š:\Êr\Ó;Ÿ?şö\é\ë\ï˜có“=epS\Ú49†‚@\î\røŠ³¥RikY\Òx•vò4.`°dBZ¦\Õ.^–`¿‹dH,~\ÊG øY\Ñt0Àµ F\\)˜’E¢\Ø\Ïz\Äjµ\İz«ˆA‚ƒ,2I\Û\á(‡ÿ“ş¿¹xü€öw…,U°©½šz\×\r\ÚJ»\0\È\'DŠÆ«¼Z\ã·\Ù&\nh\Ôl\Ã\å\É)&ñ¨şù n¥I†¹\ä\r>¯„	¼hq8¦Á Aù™dY‡xÁg\ê…ß­UAW$\î°E¶•I½«°¤ª«)ä—µ\ÖÀzNV\0FJ‹BŠ¬9…*o!¥®MDKB[5$`h¢?$yV\êOBÉ«­ŠÁ`£\0!~?\"\Ì\İS¢9\Ô\å\Ã1¤@q\ë\âÅ­¥\å8\å`\r!?]Zút\Ï\Z:ˆ¡œ(i®‰95\åk0$\'Î‹\"‘HªğU´–öØ•¦ğ\Ä\é·÷(¡öQ‡+ŸsEn\Üß¾‘£V²_Ñ˜¿v¥‰>b¢Rô—\n$¹¹\\®\í„¸ùc±j|\ÂLb\×\á\ÚS§_7+~B#—`\Æu\å\ï\Ó W»IY 	\ë(òJn+\ä]Q3EcŸqıôŸŞ—®Cƒ:şÇ›ô\"LÀ§l7¢7ˆC¹\"\ä\æNa\Â 84¡y%–À–¸	Fœ²†ò\Ós?şŸW¾\0Š\ão¶†L°jD¶#Û©<\ro—2\'d\nóu)±œL„U\×\è}ø‡1Fğ\Êğ\Û{\èPIb§ÿ÷€\âø\éJ^e£W\î\ç9r³W\ÅÄ»\'J³>)b\Ğ{]D†a–qcŸ|A=\â½\Ïj\ã\\*ø”\ë†c2UW¹\Ù}^Ac¾iAz”ş$Ÿtm\ç tm’ª6Oz\Äqó¶®²@£\Î0ş\\©£\">E|IY6CCi«\Â>•\ËE¢ùû…\n1¾yš\åA1ˆW¡T\ÌT4O_\â)95\Í:m«:EŒ\"	¡\É¶\íH\Ä4\Æc\×\ÅÁ*˜y\ïô{\ï~»b’ µ\ÏU1¹em»RVü(†Ş˜sD\ï;n\ØLb<X|¯\nÇ®,ö\æO—Šï–¯(ˆ‡\ÄI\í³	’[\Ò\Í\0/”?Š%wI7nÜˆšGŒf™7H¸¨eùúVh\Ñ<Ê‘›\ÕRğí‡ò\ØÀ\ïE\0h;Ÿ2/€±¥÷\Ş>ı&“ñ*„C\í\ÑqZ®³…•@¯¶†\'ù7\Ğ\"\Ñ<öùf0\Øüf\ÍH2Hš[†AV¨\'\Ê(hœ\Ò\ÆKIèˆ±Ø˜W#0†\r\Ûz\ß3R(-\Ê)hÔµ·K)1\"˜\ì\'€G#¢³xƒ7ŸJ&/­ú‰‘\Z\ã\çµØ’\æf)ñL3¯ªµc”$çµ‰¥bq9 B\à$0<ºô¥5‡xU-§N#&\Şl¡\Í|\n\ÄxX÷±\ÓYŠˆÄ«L›õš\n4…6]\Å6Á\èÔ¯\íXq!!*p¸\"\æ]n) ›r\å4™É„&²S\åixYcTŸú¹C·&enÉ¦+yøZ)\åP\çN©\\]Ìñ\íH^Ó¨0‰qf²¡üÚº”,Dø>•(y…y\ã;µ¥\Õ.\à3L¸P8\ÎYÍ‰\ë\è\ÉB!E6\r‘\Éù‘›Ã¦]W£\nøt\Ş+\Ş\Ø \éı\ï‰\"\È\Ä5i$g;ò\è@—r\åŠú.PŸW\ÂBv\ŞK\å\Î!¶·„\İ¡«GK1Š.Uß’.$©uŠ/µ•\èM\']\ËAti\íÀş<Z\ê/\Ç\ê¾\rQ}\"<\æÖ‘H^}eGsi)·\ég\ÜC‰e\Ğy\\·ûs`¼K¸«&uh\î\ÚXIû·\à\Ìv²¤¶e\Î^2\åFw?o¸\r\É;v\Ù\Ã\î\Â\ÜVŸ…I£udQN\Â;_2(8ABß¹0Vaß§wjü\î\Ã\Ğİ¶Á½f¸ûˆÜŠPDJ×Œ\nš_õ]\Í\ëA½§¦´‹%ôû\ÅVôCĞ±y¯±À$\å\Û`–\ç\Üï³¤\áò\Ğ$\Ê\ß|\âñş‰=0Ey\Å 1}y\ßZw^\Ö\ŞK‡(G·z£¬;hğ—\'ª¡x¤¯`ÿ•ƒ½„\0¢Ş¯NX¤	\ì\æƒ\Ívš€\â/O@)\n³šb‰\éò½÷%<06~Á\çFª\à(?`\ì°\'Š\ïWú>F7VoabAç¿a\ï\0¾LCö\äxÿı2\\P{ğ`‡hñ\å	”Š§¶P–?h8\ä\îl“•ù=8\Ş]qè‰¨#A!*ù”½Ù¦¡\ÏZ™\Ûv\ì\Í\×yø¥–ÿË¿<¤ò”}˜NıI\\ ‚e¼V/X\ÏR\Êùj\èû\å\ÜXc\çÁ—_¾B•¿˜oq%K\İ(\ËSµ|yiv›,\Í\Ç+a\Ø½ĞŠ\éwIXD·ÿ½÷dMD[¥Ÿ\"1Á‰‡(}ø\Ğ,M\á\".\ÂlgkOÀ9ˆñ+:–\Æı¯?p9aüû ‹P¤¾zp4„\ã‘cOƒp‡ıƒ \ï\îûBˆ\è£\Õ#}#ü\Ê6]sŒšoŞ±7c¾şğ\Ğğh¶oÁ¯%\á \Ëq[%Á\Z\Ã[c\n„\ãQú\è_Î¿Sb{\0*ƒ€k=ü+\È\Ã\ï\Ş\Í½}¿Ÿ=r”M\æX•·z\Ûñ\Ö^\ĞxË”lFg«Ä«;u¡\0\Ç\Ê)÷\È\Æû}6¾\Â\î\í\èvi®N \á\ÍmeÁ\Ú\ápV½YÏ®2`~Juh\ëd.ı(¢>\ç‡O¥\Z?_&\0‚ú`Ô»R!(\Èv^x\ÌÒ	>.gŸ,\ã;?ù\í›ut\'Q\æV·óñ\æy2\Ñ’g‰²§ù\Í—#ò(·y„E{/y°™\Ã{6­Tz†”2¤W\Z\â/\ë¨^I\ç\nüI\Ì\ÊB-$W\Ê<JEeO$‹\0¸5õ(WJo6HDIx.›\Împ[¿K/¶h$Ÿ*$¿ºø\Å×=şyúh›À}\Ë\Î\\v5]\Ê\år_%\É\Ô\Çx¯ª\0ÿøªt3ı\ä\É\ß.¡<}úì—©Lº¢\ÛLV¾ù\ïÿù_PıI&3\Ê$ş·“\İDNş÷`¬QR­¹l®~K>Y\åY\Ö&Çˆtÿıqss£s„\ÓO¦v£º€¡¬ƒ@ñ~òG†q\ì\ä.n\ì¾Y¯v°\Z	¯e‚™¶Œ	¥ÜşÇ¸»ˆÿ¥—)\ì\ßR}»ÿ™V8\ìÍ«¼{Œc|‡¿¶g\Z—c5coú¨›©û¯t†4´ö\æPpc;ùı\nA‹\İ4\îd\ë\Û/†‘¢ù±¢\ï\İş1½º™\Él¦ÿö/•\â\Ø\É¦¨‰\Ó“¾«\é\ÌZ=9\Â\éL¸¹O…\ï\Şı\ç?şñıó\î\İn\å—Çºº\Ã}\íIZ§ğ\Îf:f`N;—^5¬9\Z\nS?«E€\0yù‹s\Ä\Ö\Ä	\ìXœğ	Tùğ\ÜJmM’\Å\Ö\ÒeY?œM\Ó}Å_?={ò¤VoQ  ¼\\t¸”U®Xz“„7ñÂ²\Ø¬e\Ö6k‰±š	aµcµ\ÑL³·\ï¾õ\ÖÆ³K\ÇN$EPQ\"\È\ÙKOmo×¬\Ëgh³Y\ÓA&½º¶–‰\á“Ã«µÈ®®f\ç \× ı\Ä\Önª<·¶\Æs\ë\Êú[---o\Ê\Ï.]úğÃ³T>üÚ©güŠŸ´\ì®g\ÂıPHd\è§\Ù\'Ab‚`e\Öj”Áùñ\ä«+\Ôø\Íkl´\æVû\àu\å¯¼U&\ìƒ\İõ\Ï\ä	z\Å 0*\é´R*\ÉU²µ\ê\Ã730N\ä\"$\ì™Mœ4­BhsŠa\Çb{Ë²»ş5]¶“¨^¶†’&¶¯@6$^k\ÌdÈ¥\×V²\é5¢9\îÈ¬\ïVƒ±ø¨\Ò:0[\0\Û\ëóñaHxggn3\Å\Ù\íVH*U\r0…\Ãq¥\ZŒ\éö\Ä\\©\à /\ï1]u´Ûƒ\Ík‡^@\æ\Ò7ÓB@bj\ãª*@\ï9Ï¼µ7\Æ[\íë¯š²¹{\r®pA//d\ÒL\"|3\Ä%Y“6›-¾\Ş^\ÅÔšn_¿.š-\åòQ2K\'‹\'\âKk\ä›k1&Z/¶‹\Ê\Ñ/Ö«ˆğ––öõ\ç\äœs›¥\\!\Å\Şğ–w‘\×f(,\åUö\Íe%›\Å\ÈH¯©7…\í£qº†K¶H\î\ão\ÎT‰±Á\Ï\nMGvsd3]p¹ğcÀ#0ö\Ú\ÌI\æ²$Q	92\Î\×>põ)·:×´~¦ŠŒö„Áù\Ó\ÛQô¯8hƒõ/õ\äĞƒc3±º½\íkØ•\Ê\å\n ¹\\ú pS\Óóm¨U\Î\\Îœ/—•Y ŠceE#¥oşJ\ĞjŒ„7$ó:S_¥|s\çÁ\Ü\Ü\Ûj\ë½{\ìÃ§l´˜° \ã\Æ\Æ½øññXeWK¹”k0˜©Q?!)ß«iè¥‡\èG\Ûúûu¯¾\ïm;y;À³>}öë†¦õ}öôÒ‡g»Ov÷öşô\ÜôB\á\Õ\íh|øI\Ú\Ûpv3;·	«98\Z\Íp1Y\ÈóŸƒv´\Ø\Ív“ğvˆ¨=ùiy\Û\Ú^\îV¸\Ô\Êv\Ê\åØ®\å\Ê\âf&8\èJ}•]y`p•Do[[·nrÁEóë¶¶\Ş\ÅJW\ÙY\İ\ŞN\×\nd.wE·M\ïÕe&\ß—pMWGWES9³$øüE[[[5ˆñ³yp\Ô^Â›¥¬iEú¦·zŒ\ÊÁQOÁ<U=F\åà¨£<ÿ½m?{G\İ\ä4\Æİ½F…\ÊQO¹÷Ã¾0\Ú^N\×[cCiyÙ¶/Œ\Ş_ê­±‘¼zİ»OŒ†\ç¿W\Ñ\İ\Ö\Û\Ûûòu#Gbıû \\\Ğ\\µıı\ÇÄ™3Fs:Ë½õöö3‰_´uW\èF\Èò\ç\ÙK\Ï6\ÚÏœio\'ò“\rÀ\03‰LWoOvx	ºwh\Ù\ßj\'²\Şp^uo½I‹\Ñ\ê-.\ß\Ò\Ù™<…Ø±\r\çU-*›\ä¯\ŞR\Ùe\Ç6šW©Æ¨jaDÁ\Ø\Øû\ÔG)¡ıa(7V{(c\åU	£ªµO£‘¼\ê¹@\Ñ^\Í}õh\Ã\åªúˆ\èRû\Æhœ\ÒÑ®Á¨\"8Ä£\×eƒ\Ø\Æ\Ï\í\Æ8óË\r\Ï_ô¾üåŒ€±gŒsŸ:sæ—¿÷ö~\×Ñ…m½µ« {‡À&-õF\0\Ùø‰\Ì2zÛQ@ö ˜¦†ø¨|³­\×dQúH)^P]\ä£#\Ù\Ã`¸o±­-Q\ç(õ\íKUP\ì\åGß’‰„)Ù»ğ\Ñ\Ë^¡Ş¦Ò¨ƒ$m/>ú6±«\ëiù^:\Ûİ¦û|\ëE}\×H^µ¿Ô«„(½mg\É\ãƒ~ıõWø\ï³gOaúq–\Ş¸[ş\r\àØ¨«_\İ{]6´T\è\í\rEÔ¹`·\ÑÑ½m·\ë[\Ì[~3\æ0]X0¤ø½\î\î\î¿÷\ÅaHñ[{½)ö\Çq\Ò\â\å\íF¨¦m\'õ\Ñ\İ\Ûû\ï0‘\İ\ïM84 \İ\Æ)\êvK£t¸M\Ïo¿4i»{3\Õ]#€x½\Û}!“{\í?›r˜I/B4Îœ‰È«\é\ï^\ì¤·÷÷\ï\Z\r\å\Ş\îo\æU\Æğò‡\Å\İ‰l½<oı{\ï\Ş$Ğ«üşºı\ëZ½³\â\ä\Şô\âo/*‘\àMŸ_·?Îº5ô£4›cü\Õ-k}	Â‹\í?\ÇS\rğ$¬¹lÆ‚+S\Ûyı\ÃO/^Rİ‰ş/ÿ÷o\ß-\î>Zinv‘·\ì46ÙgÇ¾~\ÜŞ¾x{\äöbû\în\Ëó{Ÿ³·6>F–`4“\'b]vŒ>#o‡mpŒ•Œ½™¿û\ÄQ\Ò~6·\Æö(\â\ëañDñ[T·j\'Í·Z6<\Æ\Ü\Zõò&ô›\ì”ğ\Ãú¼È¢Jy@Gœ¼°³L\ÓMöD\rP\ïG\0\0IIDAT\0ş\íƒTCc\ì\Ğ\'oG.‹b!\Æ\Ü\ZM7›yp¸\núB\Ícüÿ{J\Ëƒ3¢\ËEjúğ\Õ÷|5a\Ù^¾Õ˜ŠQ«\ÍÂ‡#\Ìÿ\íø¶2Œl\Æ\Î#GŸLx\Æ÷/\ß\rü€şÙ»’Ñ·F¼i#W¾VV€#Yåª—pEŒÍ˜R\Æ£iub8Œ0X\Ê\Å\È)4Ìº¡dIª2±·–ñ†}\â\È\\¦›à§©†\Å6…×¸\Û=·@½Š”ñ†nqy6r\Õ\rüt9Uƒw#´ckX^Å›xyt´ñ\r&8s\"ó\Ôòª‰Î\ÈKo#]Æ±W\'“Xcè« ¥‰6x\á\0E\ékHW\r\æn\Æ\ÙÏ³q\ÇW]8šVò\ä\İ`fA<ùy\"òM\"Ñ ‹¸L¼‹¡Ä˜\Í\áXû\ÆH\Ï\éPˆl	%B‰Fº·¡—W‰iTòs\Û7!ƒñ¾—ha|€§A¶ \ÊFˆ*™µL—\ëI?e\Òp›‰yUY\Ï{‰;cSSccw6ğ\ãÆŒğ@gç©©±;\n†\Îû_M\rxQ\Æ\Æ6ZB\rx»©©©ó”—©x\Ç\ãù\Ø¥\0\é»ÓSLÁS§8‡~£\ÔTg§‚G5bŒO1Á³:\Ç\Å\Æ\í^À8¥X£ó\ÔXZ#:Bdœ\êD{ŒºCğ#f„\í<¢w\ïK:‰fT¦¦€a \ìOMtÈ\ï\09ö¨^™¾/ñ‚~‚œ2\ëp\'³‘½\Ë\\…8—×°óŸB§BJ<¶Á›\ÃJöRƒ\0è¡÷ÿ\0\ä\í´a‚Nuü\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `st_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_bank`
--

DROP TABLE IF EXISTS `st_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_bank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime(6) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `account_no` bigint DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_bank`
--

LOCK TABLES `st_bank` WRITE;
/*!40000 ALTER TABLE `st_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_college`
--

DROP TABLE IF EXISTS `st_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_college` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phoneno` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_college`
--

LOCK TABLES `st_college` WRITE;
/*!40000 ALTER TABLE `st_college` DISABLE KEYS */;
INSERT INTO `st_college` VALUES (2,'root@sunilos.com','2022-05-24 12:13:05','root@sunilos.com','2022-05-24 12:13:05',0,'root','MP COLONY','BHOAPL','SIRT','9892924545','MADHYA PRADESH'),(4,'root@sunilos.com','2022-05-24 12:14:41','root@sunilos.com','2022-05-24 12:14:41',0,'root','203, SAMPARK VIHAR','KANPUR','IIT KANPUR','9663635252','UTTAR PRADESH'),(5,'root@sunilos.com','2022-05-24 12:15:33','root@sunilos.com','2022-05-24 12:15:33',0,'root','101, YN ROAD','PILANI','BITS','9541412323','RAJASTHAN'),(7,'root@sunilos.com','2022-05-24 12:17:01','root@sunilos.com','2022-05-24 12:17:01',0,'root','45, MOUNT ROAD','MUMBAI','XAVIER COLLEGE','9456561212','MAHARASHTRA'),(8,'root@sunilos.com','2022-07-12 23:15:19','root@sunilos.com','2022-07-12 23:15:19',0,'root','Takshsheela Indore','Indore','Davv','9865230147','M.P.'),(9,'root@sunilos.com','2022-07-12 23:17:44','root@sunilos.com','2022-07-12 23:17:44',0,'root','Rau, Indore','Indore','IPS','9865230147','M.P.'),(10,'root@sunilos.com','2022-07-12 23:18:54','root@sunilos.com','2022-07-12 23:18:54',0,'root','Rau, Indore','Indore','Medicaps','8985666320','M.P.'),(11,'root@sunilos.com','2022-07-12 23:19:29','root@sunilos.com','2022-07-12 23:19:29',0,'root','Bhopal','Bhopal','LNCT','8985666320','M.P.'),(12,'root@sunilos.com','2022-07-12 23:20:13','root@sunilos.com','2022-07-12 23:20:13',0,'root','Indore','Indore','KHALSA','9865230147','M.P.'),(13,'root@sunilos.com','2022-07-12 23:20:52','root@sunilos.com','2022-07-12 23:20:52',0,'root','Indore','Indore','VAISHNAV','8985666320','M.P.'),(14,'root@sunilos.com','2022-07-12 23:21:29','root@sunilos.com','2022-07-12 23:21:29',0,'root','Kailod kartal road indore','Indore','SAGE','9865230147','M.P.'),(15,'root@sunilos.com','2022-07-12 23:22:01','root@sunilos.com','2022-07-12 23:22:01',0,'root','Vijaynagar indore','Indore','SICA','8985666320','M.P.'),(16,'root@sunilos.com','2022-07-12 23:22:45','root@sunilos.com','2022-07-12 23:22:45',0,'root','Rau, Indore','Indore','ACROPOLIS','9865230147','M.P.');
/*!40000 ALTER TABLE `st_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_course`
--

DROP TABLE IF EXISTS `st_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_course`
--

LOCK TABLES `st_course` WRITE;
/*!40000 ALTER TABLE `st_course` DISABLE KEYS */;
INSERT INTO `st_course` VALUES (9,'root@sunilos.com','2022-07-13 00:10:26','root@sunilos.com','2022-07-13 00:10:26',0,'root',0,'Java','Corporate Java','1'),(10,'root',NULL,'root@sunilos.com','2022-07-13 00:29:47',0,NULL,0,'B. Pharmacy','Bachelor Of Pharmacy','3'),(11,'root@sunilos.com','2022-07-13 00:30:13','root@sunilos.com','2022-07-13 00:30:13',0,'root',0,'M. Phill','Masters of Phillosophy','2'),(12,'root@sunilos.com','2022-07-13 00:30:39','root@sunilos.com','2022-07-13 00:30:39',0,'root',0,'Masters of  Pharmacy','Masters Of Pharmacy','2'),(13,'root@sunilos.com','2022-07-13 00:31:05','root@sunilos.com','2022-07-13 00:31:05',0,'root',0,'MASS Comunication','Jounralism','2'),(14,'root@sunilos.com','2022-07-13 00:31:48','root@sunilos.com','2022-07-13 00:31:48',0,'root',0,'Genetics Engineering','Bachelors of genetic engineering','4'),(15,'root@sunilos.com','2022-07-13 00:32:28','root@sunilos.com','2022-07-13 00:32:28',0,'root',0,'LLB','Bachelors of Legisalture','3'),(16,'root@sunilos.com','2022-07-13 00:32:44','root@sunilos.com','2022-07-13 00:32:44',0,'root',0,'LLM','Masters of Legistature','2'),(17,'root@sunilos.com','2022-07-13 00:33:12','root@sunilos.com','2022-07-13 00:33:12',0,'root',0,'BCA','Bachelors of Computer Applications','3'),(18,'root@sunilos.com','2022-07-13 00:33:31','root@sunilos.com','2022-07-13 00:33:31',0,'root',0,'MCA','Masters of computer applications','3'),(19,'root',NULL,'root@sunilos.com','2023-07-18 11:58:33',0,NULL,0,'BSC','Bachelors of Science','3'),(20,'root@sunilos.com','2022-07-13 00:34:40','root@sunilos.com','2022-07-13 00:34:40',0,'root',0,'B Com','Bachelors of commerce','3'),(21,'root@sunilos.com','2022-07-13 00:35:24','root@sunilos.com','2022-07-13 00:35:24',0,'root',0,'BBA','Bachelors of Business Administration','3'),(22,'root@sunilos.com','2022-07-13 00:35:59','root@sunilos.com','2022-07-13 00:35:59',0,'root',0,'MBA','Masters of Businees Administration','2');
/*!40000 ALTER TABLE `st_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_faculty`
--

DROP TABLE IF EXISTS `st_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_faculty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `college_id` bigint DEFAULT NULL,
  `college_name` varchar(50) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `faculty_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `qualification` varchar(15) DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_faculty`
--

LOCK TABLES `st_faculty` WRITE;
/*!40000 ALTER TABLE `st_faculty` DISABLE KEYS */;
INSERT INTO `st_faculty` VALUES (5,'root@sunilos.com','2022-07-13 00:43:34','root@sunilos.com','2022-07-13 00:43:34',0,'root',10,'Medicaps',20,'B Com','1991-04-02 05:30:00','ashok@gmail.com',NULL,'Ashok','Male','Sharma','8201489636','Bcom',14,'Taxation'),(6,'root@sunilos.com','2022-07-13 00:44:25','root@sunilos.com','2022-07-13 00:44:25',0,'root',8,'Davv',17,'BCA','1991-04-02 05:30:00','ramya@gmail.com',NULL,'Ramya','Male','Shrivastav','9856032471','BSC',9,'C++'),(7,'root@sunilos.com','2022-07-13 00:45:38','root@sunilos.com','2022-07-13 00:45:38',0,'root',11,'LNCT',17,'BCA','1988-07-02 05:30:00','sunil@gmail.com',NULL,'Sunil','Male','Pal','8201489636','M.Sc',10,'Java'),(8,'root@sunilos.com','2022-07-13 00:47:05','root@sunilos.com','2022-07-13 00:47:05',0,'root',9,'IPS',15,'LLB','1981-06-02 05:30:00','vivek@gmail.com',NULL,'Vivek','Male','Bhawsar','7898656524','LLB',11,'Constitution'),(9,'root@sunilos.com','2022-07-13 00:48:16','root@sunilos.com','2022-07-13 00:48:16',0,'root',4,'IIT KANPUR',13,'MASS Comunication','1988-03-02 05:30:00','preeti@gmail.com',NULL,'Preeti','Female','Sharma','9856032471','P.hd',16,'Print Media'),(10,'root@sunilos.com','2022-07-13 00:49:19','root@sunilos.com','2022-07-13 00:49:19',0,'root',13,'VAISHNAV',16,'LLM','1987-06-05 05:30:00','aakash@gmail.com',NULL,'aakash','Male','Raghuvanshi','9856327014','LLM',15,'Hindu Law');
/*!40000 ALTER TABLE `st_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_marksheet`
--

DROP TABLE IF EXISTS `st_marksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_marksheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  `chemistry` int DEFAULT NULL,
  `maths` int DEFAULT NULL,
  `physics` int DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_marksheet`
--

LOCK TABLES `st_marksheet` WRITE;
/*!40000 ALTER TABLE `st_marksheet` DISABLE KEYS */;
INSERT INTO `st_marksheet` VALUES (72,'Dheeraj Vishwakarma','DX105',20,54,62,98,'root',0,'root@sunilos.com','2022-07-13 00:04:04','root@sunilos.com','2022-07-13 00:04:04'),(73,'Kapil Malviya','DX106',17,81,97,98,NULL,0,'root',NULL,'root@sunilos.com','2022-07-15 21:29:44'),(74,'Mayank Gupta','DX107',25,23,71,98,'root',0,'root@sunilos.com','2022-07-13 00:04:53','root@sunilos.com','2022-07-13 00:04:53'),(76,'Ram Sharma','DX109',16,94,65,98,'root',0,'root@sunilos.com','2022-07-13 00:05:41','root@sunilos.com','2022-07-13 00:05:41'),(77,'Rupali Chouhan','DX110',27,65,87,98,'root',0,'root@sunilos.com','2022-07-13 00:06:28','root@sunilos.com','2022-07-13 00:06:28'),(78,'Sachin Birla','DX111',28,32,84,98,'root',0,'root@sunilos.com','2022-07-13 00:06:49','root@sunilos.com','2022-07-13 00:06:49'),(79,'Sanket Jain','DX112',26,32,54,98,'root',0,'root@sunilos.com','2022-07-13 00:07:10','root@sunilos.com','2022-07-13 00:07:10'),(81,'Vineet Goyal','DX114',18,88,91,99,NULL,0,'root',NULL,'root@sunilos.com','2022-07-15 21:28:58'),(82,'Vishu Lumba','DX115',15,97,96,98,NULL,0,'root',NULL,'root@sunilos.com','2022-07-13 00:09:02'),(83,'Yash Kanoongo','DX116',14,94,65,98,'root',0,'root@sunilos.com','2022-07-13 00:09:24','root@sunilos.com','2022-07-13 00:09:24'),(84,'Aman Jain','DX100',30,69,77,55,NULL,0,'root',NULL,'root@sunilos.com','2022-07-17 10:02:12'),(85,'Riya chaturvedi','DX120',31,65,75,55,'root',0,'root@sunilos.com','2022-07-18 10:25:29','root@sunilos.com','2022-07-18 10:25:29');
/*!40000 ALTER TABLE `st_marksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_message`
--

DROP TABLE IF EXISTS `st_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `body` longtext NOT NULL,
  `code` varchar(10) NOT NULL,
  `is_html` varchar(150) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_33m7f3qh2o7ko8x2p87mlygkd` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_message`
--

LOCK TABLES `st_message` WRITE;
/*!40000 ALTER TABLE `st_message` DISABLE KEYS */;
INSERT INTO `st_message` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'<HTML><BODY>\r\n\"   <H1>Your password is reccovered !! </H1>\"\r\n        We have recovered your password and here it is <br>\r\n        <h3> User - {user}\r\n        Password - {password} </h3>\r\n </BODY></HTML>\r\n','U-FP','Y','ACTIVE','Forget Password','EMAIL');
/*!40000 ALTER TABLE `st_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_role`
--

DROP TABLE IF EXISTS `st_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `can_delete` varchar(1) DEFAULT NULL,
  `can_read` varchar(1) DEFAULT NULL,
  `can_update` varchar(1) DEFAULT NULL,
  `can_write` varchar(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_role`
--

LOCK TABLES `st_role` WRITE;
/*!40000 ALTER TABLE `st_role` DISABLE KEYS */;
INSERT INTO `st_role` VALUES (1,'Admin','Active','Admin',0,'root','Y','Y','Y','Y','root@sunilos.com','2025-02-12 20:12:22','root@sunilos.com','2025-02-12 20:12:22',NULL),(2,'Customer','Active','Customer',0,NULL,'Y','Y','Y','Y','root',NULL,'root@sunilos.com','2025-02-12 20:12:06',NULL),(6,'Shop','Active','Shop',0,'root','Y','Y','Y','Y','root@sunilos.com','2025-02-12 20:11:23','root@sunilos.com','2025-02-12 20:11:23',NULL);
/*!40000 ALTER TABLE `st_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_student`
--

DROP TABLE IF EXISTS `st_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `college_id` bigint DEFAULT NULL,
  `college_name` varchar(50) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `enrol_no` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_student`
--

LOCK TABLES `st_student` WRITE;
/*!40000 ALTER TABLE `st_student` DISABLE KEYS */;
INSERT INTO `st_student` VALUES (14,'root@sunilos.com','2022-07-12 23:24:20','root@sunilos.com','2022-07-12 23:24:20',0,'root',11,'LNCT','1998-06-02 05:30:00','yashkanoongo493@gmail.com','DS160@123','Yash','Kanoongo','9856032471'),(15,'root@sunilos.com','2022-07-12 23:25:20','root@sunilos.com','2022-07-12 23:25:20',0,'root',16,'ACROPOLIS','1994-05-02 05:30:00','vishu@gmail.com','DS160@121','Vishu','Lumba','9856327014'),(16,'root@sunilos.com','2022-07-12 23:26:13','root@sunilos.com','2022-07-12 23:26:13',0,'root',5,'BITS','1998-01-02 05:30:00','ram@gmail.com','DS160@122','Ram','Sharma','8201489636'),(17,'root@sunilos.com','2022-07-12 23:26:53','root@sunilos.com','2022-07-12 23:26:53',0,'root',8,'Davv','1998-05-01 05:30:00','kapil@gmail.com','DS160@124','Kapil','Malviya','9856302147'),(18,'root@sunilos.com','2022-07-12 23:28:02','root@sunilos.com','2022-07-12 23:28:02',0,'root',5,'BITS','1998-05-01 05:30:00','vineet@gmail.com','DS160@125','Vineet','Goyal','9520147635'),(19,'root@sunilos.com','2022-07-12 23:28:02','root@sunilos.com','2022-07-12 23:28:02',0,'root',8,'Davv','1994-05-02 05:30:00','nilesh@gmail.com','DS160@126','Nilesh','Gurjar','7898656524'),(20,'root@sunilos.com','2022-07-12 23:53:00','root@sunilos.com','2022-07-12 23:53:00',0,'root',4,'IIT KANPUR','1994-06-02 05:30:00','dheeraj@gmail.com','DS160@127','Dheeraj','Vishwakarma','9820145637'),(21,'root@sunilos.com','2022-07-12 23:53:41','root@sunilos.com','2022-07-12 23:53:41',0,'root',12,'KHALSA','1997-06-03 05:30:00','dheeraj1@gmail.com','DS160@128','Dheeraj','Haryani','9856032147'),(22,'root@sunilos.com','2022-07-12 23:54:35','root@sunilos.com','2022-07-12 23:54:35',0,'root',2,'LNCT','1994-08-02 05:30:00','aayush@gmail.com','DS160@129','Aayush','Goyal','7856320149'),(23,'root@sunilos.com','2022-07-12 23:55:31','root@sunilos.com','2022-07-12 23:55:31',0,'root',11,'LNCT','1993-02-05 05:30:00','amar@gmail.com','DS160@130','Amar','Chouhan','9865302147'),(24,'root@sunilos.com','2022-07-12 23:56:35','root@sunilos.com','2022-07-12 23:56:35',0,'root',15,'SICA','1998-01-02 05:30:00','abhi@gmail.com','DS160@131','Abhishek','Patidar','8902136547'),(25,'root@sunilos.com','2022-07-12 23:57:57','root@sunilos.com','2022-07-12 23:57:57',0,'root',13,'VAISHNAV','1998-05-02 05:30:00','mayank@gmail.com','DS160@132','Mayank','Gupta','9802314657'),(26,'root@sunilos.com','2022-07-12 23:58:48','root@sunilos.com','2022-07-12 23:58:48',0,'root',14,'SAGE','1994-05-02 05:30:00','sanket@gmail.com','DS160@133','Sanket','Jain','8021453697'),(27,'root@sunilos.com','2022-07-12 23:59:36','root@sunilos.com','2022-07-12 23:59:36',0,'root',5,'BITS','1996-08-02 05:30:00','rupali@gmail.ocm','DS160@134','Rupali','Chouhan','9028653147'),(28,'root@sunilos.com','2022-07-13 00:00:32','root@sunilos.com','2022-07-13 00:00:32',0,'root',6,'VITS','1997-02-05 05:30:00','sachin@gmail.com','DS160@135','Sachin','Birla','9856320165'),(29,'root@sunilos.com','2022-07-13 00:01:25','root@sunilos.com','2022-07-13 00:01:25',0,'root',7,'XAVIER COLLEGE','1996-04-02 05:30:00','shiv@gmail.com','DS160@136','Shiv','Kushwah','9802145637'),(30,'root@sunilos.com','2022-07-17 10:01:01','root@sunilos.com','2022-07-17 10:01:01',0,'root',16,'ACROPOLIS','1995-12-03 05:30:00','aman@gmail.com','DS160@250','Aman','Jain','9874569874'),(31,'root@sunilos.com','2022-07-18 10:23:41','root@sunilos.com','2022-07-18 10:23:41',0,'root',12,'KHALSA','1995-12-25 05:30:00','riya@gmail.com','DS160@260','Riya','chaturvedi','9874563215');
/*!40000 ALTER TABLE `st_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_subject`
--

DROP TABLE IF EXISTS `st_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_subject`
--

LOCK TABLES `st_subject` WRITE;
/*!40000 ALTER TABLE `st_subject` DISABLE KEYS */;
INSERT INTO `st_subject` VALUES (8,'root@sunilos.com','2022-07-13 00:38:04','root@sunilos.com','2022-07-13 00:38:04',0,'root',17,'BCA','C language',0,'C'),(9,'root@sunilos.com','2022-07-13 00:38:20','root@sunilos.com','2022-07-13 00:38:20',0,'root',19,'BSC','C++ Language',0,'C++'),(10,'root@sunilos.com','2022-07-13 00:38:46','root@sunilos.com','2022-07-13 00:38:46',0,'root',18,'MCA','Java Language',0,'Java'),(11,'root@sunilos.com','2022-07-13 00:39:26','root@sunilos.com','2022-07-13 00:39:26',0,'root',15,'LLB','Constitution part1 & 2',0,'Constitution'),(12,'root@sunilos.com','2022-07-13 00:39:59','root@sunilos.com','2022-07-13 00:39:59',0,'root',22,'MBA','Ethics and laws of bussiness',0,'Bussiness Law'),(13,'root@sunilos.com','2022-07-13 00:40:52','root@sunilos.com','2022-07-13 00:40:52',0,'root',14,'Genetics Engineering','genetics of human body',0,'Core Genetics'),(14,'root',NULL,'root@sunilos.com','2022-07-13 00:41:36',0,NULL,20,'B Com','Taxation and slabs of fiscal policy',0,'Taxation'),(15,'root@sunilos.com','2022-07-13 00:42:20','root@sunilos.com','2022-07-13 00:42:20',0,'root',16,'LLM','laws of Hindu religion',0,'Hindu Law'),(16,'root@sunilos.com','2022-07-13 00:42:51','root@sunilos.com','2022-07-13 00:42:51',0,'root',13,'MASS Comunication','media of printing ',0,'Print Media');
/*!40000 ALTER TABLE `st_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_timetable`
--

DROP TABLE IF EXISTS `st_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_timetable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `exam_date` datetime DEFAULT NULL,
  `exam_time` varchar(50) DEFAULT NULL,
  `semester` varchar(30) DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_timetable`
--

LOCK TABLES `st_timetable` WRITE;
/*!40000 ALTER TABLE `st_timetable` DISABLE KEYS */;
INSERT INTO `st_timetable` VALUES (1,'root',NULL,'root@sunilos.com','2022-07-13 00:50:24',0,NULL,20,'B Com','Student must present with their admit card','2023-06-15 05:30:00','08:00 AM to 11:00 AM','3 Semester',14,'Taxation'),(2,'root',NULL,'root@sunilos.com','2022-07-13 00:52:21',0,NULL,19,'BSC','Student must present with their admit card','2023-02-21 05:30:00','08:00 AM to 11:00 AM','2 Semester',8,'C'),(3,'root',NULL,'root@sunilos.com','2022-07-13 00:51:04',0,NULL,10,'B. Pharmacy','Student must present with their admit card','2024-02-13 05:30:00','12:00PM to 3:00PM','3 Semester',13,'Core Genetics'),(4,'root',NULL,'root@sunilos.com','2022-07-13 00:53:30',0,NULL,18,'MCA','Student must present with their admit card','2024-05-29 05:30:00','3:00PM to 6:00PM','2 Semester',9,'C++'),(5,'root',NULL,'root@sunilos.com','2022-07-13 00:53:57',0,NULL,15,'LLB','Student must present with their admit card','2023-03-07 05:30:00','12:00PM to 3:00PM','3 Semester',11,'Constitution'),(6,'root',NULL,'root@sunilos.com','2022-07-13 00:52:53',0,NULL,16,'LLM','Student must present with their admit card','2024-06-14 05:30:00','08:00 AM to 11:00 AM','3 Semester',15,'Hindu Law'),(7,'root',NULL,'root@sunilos.com','2022-07-13 00:51:51',0,NULL,22,'MBA','Student must present with their admit card','2023-06-07 05:30:00','12:00PM to 3:00PM','1 Semester',12,'Bussiness Law');
/*!40000 ALTER TABLE `st_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_user`
--

DROP TABLE IF EXISTS `st_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `alternate_mobile` varchar(50) DEFAULT NULL,
  `login_id` varchar(50) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `access_time_from` time DEFAULT NULL,
  `access_time_to` time DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `unsuccess_login` int DEFAULT NULL,
  `valid_from_date` datetime DEFAULT NULL,
  `valid_to_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_user`
--

LOCK TABLES `st_user` WRITE;
/*!40000 ALTER TABLE `st_user` DISABLE KEYS */;
INSERT INTO `st_user` VALUES (71,'Rajat','Dhakad','Harda@123','Male','1990-01-15 05:30:00','rajatdhakad5@gmail.com','8976543210','9876543210','rajatdhakad5@gmail.com',1,'Admin','Active',0,NULL,NULL,NULL,22,'2025-08-29 14:09:44',0,NULL,NULL,'root',NULL,'rajatdhakad5@gmail.com','2025-08-29 14:09:44'),(72,'Priya','Singh','Priya@123','Female','1992-07-10 00:00:00','priya.singh@gmail.com','8876543210','7676543210','priya.singh@gmail.com',2,'Student','Active',0,NULL,NULL,NULL,21,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-01 01:59:35'),(74,'Neha','Kumar','Neha@123','Female','1994-11-11 05:30:00','neha.kumar@gmail.com','7476543210','8876543210','neha.kumar@gmail.com',2,'Student','Active',0,NULL,NULL,NULL,19,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-01 01:58:48'),(77,'Manish','Patel','Manish@123','Male','1980-12-01 05:30:00','manish.patel@gmail.com','8576543210','9876543210','manish.patel@gmail.com',5,'Faculty','Active',0,NULL,NULL,NULL,18,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-08 19:06:39'),(78,'Pooja','Mehta','Pooja@123','Female','1991-02-28 05:30:00','pooja.mehta@gmail.com','8876543210','8876543210','pooja.mehta@gmail.com',2,'Student','Active',0,NULL,NULL,NULL,20,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-01 01:59:13'),(79,'Aakash','Thakur','Aakash@123','Male','2024-10-01 05:30:00','aakash.thakur@gmail.com','8776543210','8876543210','aakash.thakur@gmail.com',2,'Student','Active',0,NULL,NULL,NULL,16,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-03 10:25:14'),(80,'Kiran','Bhatia','Kiran@123','Female','2021-02-02 05:30:00','kiran.bhatia@gmail.com','9876543210','8876543210','kiran.bhatia@gmail.com',2,'Student','Active',0,NULL,NULL,NULL,17,NULL,0,NULL,NULL,'root',NULL,'root@sunilos.com','2024-10-01 02:10:12'),(87,'Kashmira','Patel','Harda@123','Female','2024-10-17 05:30:00','kashmira@gmail.com','8565458565','8565485455','kashmira@gmail.com',2,'Student','Active',0,'root',NULL,NULL,26,NULL,0,NULL,NULL,'root@sunilos.com','2024-10-03 11:28:17','root@sunilos.com','2024-10-03 11:28:18');
/*!40000 ALTER TABLE `st_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-30  0:13:13
