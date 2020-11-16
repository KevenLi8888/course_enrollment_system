CREATE DATABASE  IF NOT EXISTS `course_enrollment_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `course_enrollment_system`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: course_enrollment_system
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `admin_list`
--

DROP TABLE IF EXISTS `admin_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_list` (
  `adm_id` varchar(10) NOT NULL,
  `adm_name` varchar(10) NOT NULL,
  `adm_school` varchar(45) NOT NULL,
  `adm_mail` varchar(45) NOT NULL,
  `adm_avatar` blob,
  PRIMARY KEY (`adm_id`),
  CONSTRAINT `fk_admin_list_user_login_info1` FOREIGN KEY (`adm_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_list`
--

LOCK TABLES `admin_list` WRITE;
/*!40000 ALTER TABLE `admin_list` DISABLE KEYS */;
INSERT INTO `admin_list` VALUES ('admin','admin','admin','admin@uestc.edu.cn',_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0ôô\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0M\0\n\0\0!1AQa\"q‘#2BR¡±Á3r\Ñ$b%4CS‚’¢²\á5csñ\'DTUtƒ“ðÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0!1ÿ\Ú\0\0\0?\0\ïèˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ‚Ž\è¡\Æ\í9\ï\Ü\ë\çh0DÀwS\ßd¨…¼”Ïƒs\î\Å\í J[#I\ï£šž\ÃÒ²}Ã‰\äóŠ¸)V\Þõ6v\æ\Ûf\ã\Û\\÷p²n(\Ä)|\ÂHAr\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"&U	*‹\á=\\4\í.šVF\ÑÌ—¸\Õ`+7JP\äO~¢k›\Ô	?’\r™‡.ð\èx³›\Ün\Ç\ái+.úh¨‰»;ñ\ÞØ‰A\Ós(÷\ÛE\È@õš–ù˜N\ÉA¼\Z\"r?\Ïq°žç´„Ó†BÞ‘‰m\×\èÙ–‘\êò\àwõ®\Én\ÖZz\ï#c ¼Q\Ï!<˜\ÙGø+5}‚M¦k­S1®\í¢=™ü/\Ú~a+¢«–†º\Z¨N$…\á\í÷ƒ•6t•\î-A¦hnq9¤MK€?e\Ø\æ>j\ÖQ\Ïo­š–¥†:ˆ^Xö\ÑÃ¨]7gwé›™´\Ü$qµ\Õ;‘\ÏðŸ\Ýð($ýM\\‘jfŽ‡W\È\à\Ñó+V¸\îv’¶µ\æ[\Í<…¿v‡£>\âê›ûVWŠš©=Z9K\"„8†µ£§%¥‚AA)ß¿\Ú>2p+]\î‰|\é	¥\0È‚´ÿ\0ú\Ô]=Upq\ä‚O”>–ÿ\0\ék\à\é¤“yÃ¢­oŸf¢\â®<\n	yE¼z:¸0b\çœ+xp·\ZÍ¾\æÀú\Z\Úz†ž”\Ê	{—¢–¾²†Q-%T\ÔòŽŠB\Óù ž@«”KÓ»Õª\ì†8\ç©m};~\ä\ã.\Çóu]‡Mï–™¼¹±V¹ö\Ù\È\Ç>Á>NA\Ô\Ñy©k ¬…“\Ó\Í\Ñ<e¯\Ù/@<UZç†Œœ © /œ\ÕS\Ä\éf‘±\ÆÑ’\ç\0ø•\Ï5¾\ïY4³e¦¦‘µ\×0\"Œ\å­?\â*;\ê}\Ç\ÔZ­\îmuk™NzA²ÁýPHmO½zVÁ\Ç<\ï¹U4ã³¦û9óEÇµù\ê{£Ÿ¾H\í\Ô\äò\0_\æ\\\Ãc#7d\ÑwýE(e²\Û<\ã<\Þ†‰Aä¯¿Ý®.¯¸\ÕTsõ’’±§™\Ê\íVOG›µKXûµ\Æ*Pz²6ñ8-Îƒ\ÑóLÓ€j\êª\ê]\Å\Â?$…¸§\Ù-[s\äþy	^ö\í.ˆoKPCŽc\ÅSš™N\Ú}á ©Ç»+W²z&¨’-Ïˆÿ\0\å\ÈB›KQ=-C&‚GG+NZ\æœT\Ñ\ÐÕ•—jª¸zÌþ.¹ZÍ¿c´…s*{\æ,psY$™nB\è\ÐÀ\È\"dQ´665 `\0ƒŒ\î\Ö\ÓO~™×»\r5®?\Þ 7´ÿ\0\Ïz\äúkluE\Òÿ\0\r$–ªšX™ 2\Í3Z\Ð>}ÿ\00‹sÞ­\àóA\Êõ&\ÈÙµK*â¨’’~¶BÁò3…\é´ln¶\Æô\Ò\×K\Þg/]4* \Ô\éö\ßG\Òÿ\0OQ{\Ë2½­\Ñzh7\Åo\Çþ€YôA€þ\ÅiŸþ\Ãoÿ\0ø7ú/ŒúJ\ÔFY&Ÿ·zýHeDú\å³:.\â?ð‘N\ì`:å‹jGj¦9\Ò\Ø.l{{ ª?ñ!•\ÏzU~\Û\íO§Iu\Æ\ÑP\Èÿ\0\Ú\Æ8\Ø~!kXp\ÎG/=¤“D\è\äc^\Ç‘W8Õ›-§5dž’?£«\Ì>²O›PG­\'¸\Ý!S¨kiÉ¦\åŽü»”\Ñ³d\Ö²™ò\n+—CM+¹?Í®\è}\Ê9k\r½¾h\ê·G]N\ç\ÓgØ©ŒeŽ²\Ö\"žZiY,/s$ac\ÚpZ|B	\í\Å\Í\\¸&\ÚoK¥–­Q;A 6*³\Þ|ýWw‚fOd\Ís2\×4\äƒèˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€¨J¹þ\á\îu»ERvQð\Õ]	Žœ;\ìù»\É\ÓÔ–\Í5@\êË¥[ ˆt\â<\Ý\äz:\ë|n—£-Œ\Z\n{&`~µ\ãö\ê=Ot\Õï¬¹\Õ>gxI\á`ðchmõw\Z¦R\Ñ\Ó\ÉQ;\Îm.qAò–I$ys\Þ\\\ârI9$ø­£I\í\å÷W\Ô5´T®e6}ª™\Õu=	°ùŽŽ§y\âûM¢o\èóû.\éGG\r;)é¡ŽX0\ÖF\Ü\0s\r-±Zv\ÌY=ÏŽ\åT0H“”@ùêº-5%;a§‚8£o \Æ7\0/B §ðL*¢\" \"\"\" \"\"\" \"\"\" \"\"”D+¶Ž\çG%e;\'§”ö<d£\Î\å\ì³\í\r–\ï§X\é(š¥¦\ê\èÇ‹|B’k\æöq\äHÁ \0pE\Û6Ÿv¥¶KO`¾JEÉT;¬~G\Éd7ki™%÷NR\à€]SKøñ4~¡pL\É\â\äz{OhelÑ¶F89Ž‚\ÑFÝ§Ý§\Ú\å‚\Ã|›4Ow5/vL^\0Ÿ#£•’\Æ×±Á\Íp8ƒ”DD@DDD@DDD@DDD@DDD@DDD@DDD@DDk\Â2­|€1\Å\Ç\0w®	»¶[\ÛX4ýF1\ì\Ô\ÕF~miý\Ðl[•¼V\çµ\Ù\ÞÚ‹¦öól\ß\ÞTg¬®©¯«–¦ªg\Ë<®.{\ÞrI_)$t’¹\îqsœrKŽI+xÛ½¹¸kk‹d-tV\È^=bs\Ë#¼7Ä ñè½º\ëZ\Þ\nVöTŒ?[Rñ\ì´yx•(tf€²\è\Ú\ÇCN\×\Õ9£µ©x\Ë\ßñ\îY»=š‚\ÇoŠ†\ßN\Èi\âhh\rq\Þ|JÈ€\0\n¨ˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ>o`#‚n\î\Ò\Ûj\'2TÒ±¿ó7÷¿\á|\Þ\Ð\îDdw$ƒ\Ë\\9Œ\ç\Év½Ÿ\ÝCn–\r={™Æ‘\Ä2šw»ø~\r>KÑ»\ÛPi\ÌÚ†\ÃNLGÚ©§g\Ýñp†X\ìŽDtA=\Ù xÁ\è¯\\g7MõfŸ¿TñJ@m,\Ï\ï„Ÿ\ÞA\Ê‘{X\Ò\ç8´d’z#œS\ÑG\Ý\â\Ý>\Ýó\é\ËGÕ´–\ÕN\ÃÔº\Óú ó\î\Ö\í\ÉY,¶?Q\ÃN\ÂY=Lgœ‡¼4ø. \\\ç’IñGó\'+\Ño¤š¾¶\ZJxÌ’\Ìð\Æ4w“\ÑÍ·ú\Z·[\Þ\ÙO\Ú8œ\rLý\Ìo‡¼©ue²\Ð\Øm\Û\íð6(\"h u>%aôƒF\éz{|mw%DŸ‰\ä~\Ý\Ö\0UN‹\Ë]_Ko¥uM]Dp@\În‘\ç\0 õ\"À\Ú5‚û; ¶\Ý)\ê%o\Ük¹ü–yPô(+•L®E¸û\Åý‘»‹M²–*š¦´:W\È\ã\Â\Â{¹w¬¦\Ø\îƒ5\×oKSN\Újø\0ykNZöø„)\Zrª\" \"\"\" \"\"”‘µ\í-sAk†#ªŒû¿¶\ÃU-ú\Ñú2S™¢hþ‰\ê\á*Nayn0\Ü(æ¥¨‰²C3\ÇDF)d‚f\Ë‹\Ã\Ä\×D*vq­µ}]+EÒ”\0\áþÑ\Î÷®¹zm|\ìš%\rF]O1¼\Ú|\Â\Öôõ\î¯N^i\î”rM³\Ë\ïññA9Á\ÈUXm1¥ÔºvŠ\ëLðYPÌx]ÐY”D@DDD@DDD@DDD@DDD@DDBpJ\ÓwZC£t¼\Õ|m5’Îš>òó\Ðû‚\r?y7(\ØhcµH>¨n&x?\Âaðó*3=\å\ï.w7’Jõ\\k\ênUr\ÖU\Î\éf•\ÜNsU\ã@+­\ì6›úKW>\é+\Z\èhc%¹üg\\ªššj©\Û¾YÉ¬`\É*X\ìî“ŸK\è\æŠ\è{:Ú§™^\ÓÕ£¸ ðŒ•r èª‚Ž\äuô„\Õ}ÎNÁ!\ÃoP\Z~ÓöA÷ù©#\Ã\\\î€d¨O®n\Æ÷­.\×\âDµ\á\ÏsAÀýSE\ÏU°´¾‰\Îlæ¥§¯56ÂŠ\ÛaúS[²¾F\rùþ#\ÑJ¤D@By\"Á\ê\ÍA—\ÓU×‰‡i\ã\ËYøœyó(3\\\\ú+º¨«ûj\át’\Ôüy0v`{>RZÁxŠýd¤¹À}Šˆ\Ãñ\àPe|\æwO\ái+è±·ù\Í5‚\á3yS¼‘Aµ]\Å÷=Ss¬q.\íjFOvpKôw¡3jË…g0\Øi¸9w—û.=;Ì“\Èó\Õ\Ï$üÔ†ôq¤\r´]\ê\ÈÁ|\Í`>\àƒ¹\ÉUD@DDD@DDD@DD\ZÎ¶\ÒtÚ¿MU[g\r\í8¡~9±\ã¡¢†·*	\íW¨ªX[48xT\î~8J[û£›\ÔÚ’’\ÉõU!½\Î\î(1»¬\Ýl½:ÁW.)+9\Ã\Äy2_û©0{”‚¢Zjˆ\æ…åÁ\Ìp<ÁS\'nuSun‘£¯/ 7³¨¨6ôT*¨ˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆŠ\×;’5ÂºuÕ•2á……\ïq8À\n\ëýcU¬u$\ÕÒ½Þ¬\ÓÁOy1«ªoÖ¹\àÆ•¡”d€ú·4ôðg\î¸	\ç\Ñª­kž\àÖ‚Ov1\ÍtM\Òm\Ôú\Æ7\Ï\í¥=\ÙÏ²>%g\Ú\rO§,1\\j\é›ô¥c8ž\\2cop¨4aQŒ\r\0€\èŠ‡¡A¬n\r\Ü\Ù45Ú¹Ž\Ã\Ù	k=ç’…²8¾G?$’I*P\ïýq¥\ÐL®Ç¬Ôµ„x’T\\oR‚Lz>\Ú.Ž¨¸¹ž\Ý]AÁÿ\0y.Èµµ¶‹f\Þ\Ù\éÀ0’<]\Ím\Èˆ€¹^þ\Ô¶\á\ÌŽÖª6ŸÌ®¨¹7¤ý¼a“k#\'óA:‡)¥·t\â›oì±´ò\í%BÁ\ß\îS_o¥\è++›\Ìz³PlÈˆ€ˆˆˆ€µ\Ýu!‡D^1Jÿ\0\ÑlKY\Ü—\è;\È?Ý\É)<\ÎTžôzhþ\ÂÔ¸µnýŒ.\ëÓª“þD`§Žý¸:* \èˆˆ€ˆˆŠ\Ò\à\Ü\åÈµ*\É\Ò4·#A5ò™µ\Ü% \ä\àOE´C<s\Æ\Ù\"x|n\0µ\Í9TD@X\Ë\í¢–ûh¨¶\ÖF\ì-9\î=\Åd\Õ4_QYjtþ ­µÔ´‰)\ä-\ÉGP~#{\Ù]\\\ë®Ž\Ý<Ø¡¯ú³“É²}\Óó[Ÿ¤’m6¦¦\ÚCS\Ã\á÷]û.O+\é\ê4N-‘Žk‡q\Â	\î\ÞþyW-Woµu>Ž ¸“™K;9¼ž\ÞEmHˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ_\Ö\Z–›Iiê«µO1p\Æw½Ç Y\çœaF­ûÕ¦\å~Ž\Ã™§£RpžFCýrk¥\Ê{µÊ¢¾ªG>¢¢C#\Ü|IYKe‘\í\Óuú‚¡¿Ý¡\"³÷\äw‡¸eb\ív\é®\×Jj\ZvK<Ì®±¼tpim)§´­&Xò‘Ë\Ø\ÆO\ÍÀ\Ï?Š•¦›g\Ðñ\Ü$n*..\í\\O\àš?uh\àuUd07\íJö°{\ÉÂœöZ[l”4Lhk`‘\àt¼\"\"ˆ‡¢\é!?ù¶\Ëz\Ê÷\ã>J?RE\Û\ÕE{\Þó+·zH¿ü\ådgwdóù…\Æl¾\Õ\î„\ç³þ ‚pY \ÖJH\é\Ø\ßùB÷¯(\Å4@t\ào\è¾\Èˆ€¹\îôQú\Þ\×\Ý02b\à”|BX=_nm%v¡#=µ3À÷‘ú ƒø\ÏE/6r¼\×í´\ä\Å\Åødk¢ya\ÓIH¿G[ÀšÁqµ9\Þ\Ü	Z?\Â\îH;z\" \"\"\" ,6ªƒ\Ö4­\Ò¼t\Ïýe|j¡²\ÄFC\Ø[ƒ\æ@©Ž\à•$½jÃ´½Æ‘\ÅHwÀ…oôn·ß«\é^0b\í»²º·£\Õ\èSj*û[‰þõ{üMÿ\0²	(:UkNB¹`uŒ•\é¼´¤‰™Jò\Ò:ŽK<±:’>\ÛN\\\ã\ç\íR\È?\å( Ù½\Å\Î$¹\Ç$žõ,vJ\ï-\×o)„\Ò¾™î‡™\É\0J&}—{”Œôo‘Î°\ÞXO²Ú–<=”ÁtDDA‡\Ô\Öhoú~¾\Ù;AeD%£ù±\Èüð¡m$”³\ÒLe‚CÁñ©\æGz‡ûÁh6Å¹}]QÁ\ßÿ\0Š‰\è\í}im\Â\Æ\çó\Ïo\'\àW|>\Ùû\Ãlû‹n{Ýˆ\ç&½\ÓóS¿d ª\" \"\"\" \"\"\" \"\"\" \"*8á¤ \Äj{\Ý>ž\ÓõwJ‡†²\É\ïwpù¨Kt¸Muº\ÕW\Ô8ºZ‰#‰ó+¾úD\êCAm±FüËª&-€ù¨õO–V±€¹\Î 4òz \ìû¤m\ÞmEStŸW{\ä#™øˆßº\ïY\ÜWfš¬ª\ZO7K\è\Ûu¯…¢VB1\íH\înýTj\ÞW—n}\×<ðXü(1woúO_Y\éˆ\È5-q÷jj3¢‰›gÜªG;¬q=\í÷\áKA\ÑQD\×\ÒE‡\éK#ñË±xÏžW±¼2û@\ã\Ý;\æ~ô‹·™lºð?ƒ9\Ç\Þu‰\îŽV½‡iÖ˜‡R\ÄGBÁú/ªÁhû¬W#k­‰\ÜBJv|ÀÁü\Öuhs]ÐŒz¡!ž\å\é\Ç\é½q_HD2He„÷»šúm–®v\Õ\Ô\ÕO\'\Õ\'=C{‹I\ëð]\Ç{44š†\ÂË¥u$†ý§G\Þ<\Ô]p-y óô‚xç’Dð\æ=¡\Í#¼…}—Ù\Í6=7y¨úÑ†\Ñ\Êó\É\ß\à\'\ÇÁwF?ŒrAz\" \"\"µ\à‘\É\\‡¢µ¾ºiÖZÛœQ†\Ò\ÜÅ9	\Úý—;\Ó×š­=}¤ºR<¶Zy\Ç>Dwƒ\ï\n^n§\Ö:fj\rC>²\ç\î¿¡Pæ¶Š{ml´•Qös\Â\â\É\îX!ß°^©/\ÖJ[Ã¡¨Œ<c\îøƒ\æQE\í•\×\ÓY/qØ«$?GU¸ˆÁ\é‡¿\ÜTŸk¸°Gz‘‚óÿ\0ƒWø\ïÿ\0¤¯z\Ç\Þ\Þ#²W¸ô\ÒùJ+/ñ_ü\ÇõRÑ´ÿ\0šoŸúñÿ\0Ò£Ô‡2<ø¸•!½š~ˆ¾rõˆÿ\0\éA\ÝQPôQó\Ò*\Æ–\Û\Û:Ÿ\î\Ïøsª‹šo}»×¶Î²@\Î))\åd øóüE‹eK¨n”µMûP\ÊÇ\nsÛª\Ù[o§©a³Fð!@ü\á\Ù\è¦\ÑÜsÛ‹\\¯‘µ\Ñ<ûô\Â\r\íöJª£¹5P\ß[«Ü‰£\Î[M\"Ã¿÷X=­¶Gv\Ü[E4­\âŒK\Ú8(Ê³sª\rN\â\Þ^Nxg-ù-—`©„Ûˆ%#=3\Ýû ”\Ø$(›½ôN¥Üª\Éögcß’–¼°¸/¤NŸ/†\Ý~¾\Ë«\Ê@ñ\æ\ßÐ \æ;StÅµL÷b9$\ìœ˜aLvôP.šy)*¢ž3\Ã$oi#˜S[Gj56–·\Ý!xq–!\Ú\0yµã“ø \ØDD\Z–\â\éá©´U\Æ\Þ\Æ\æn\Ò/\æo5\r&\Ôó:7=Ž!ÀŽ„)\ìñì¨©¼ú&]?ª$¹\ÓD~Ž¸+KG(\ß\Þ\Óú \ÝöW²[l\Úrªf‰by}0\'™i\ê>k»(Y·¬­v»´zƒ^e\r\'€to~|”\Ò*ˆˆˆ‚\×48`ŽJ4o>Ú‹%i¿Z¡w©N\ì\Î\Æ7\"\'xûŠ“+\ÍYIu<´\Õ1¶Xdik\Ø\áB\ÒC3$‰\åi®Ð©-´{­ý¡dv;Ì€\\X\ÜE1\åÛ\ã\æ¹\Ö\æm%n™™÷+SUk{‰-c2\è<’\×ö\ÒÁt¹kky¤‚`\Ø%’^\0ñ(&0$«•¬j¹®hpÁ\\wv¶¢MI/\ÓVHš.\0bhº	Gˆó]‘Q_\Û\í¥\Ô\êzZ‹­”Tt\Ï¹\Ï#.# \nO1 1 @+¸Bª\" \"\"\×5\Õo¨h‹\ÕG\à¥\æ1û­s\íºGoÛšè‹±%Ql-9<\ÐD¦õRw\Ñò°\Ñ5U89¨ª?&òQ‰½T\ÇÚ‹`µ\íÅ¢!\ÖH»cþ÷4¨DDD@XgF\Êýy¦p\È}$œ¼\ÃIý–yy®[ªXFC¢x ÿ\0)A#ƒ\ÝÈ©-\è\ï[\Û\é…!\'û½Y#\Ü\æ…\ë[Á_P\Ð9	\\?2»§£uI\ã¾\ÓwŸžH!\ÑETD@DDD@DDD@DDGtUTw\Ù(!V\âS¾›_Þ£y\Éõ—\æ¶ÝœE¸|Ÿ­¦{GŸz»~\ìÂƒ]²¶6‘t\ä\ã‘p8+P\Ð7Á¦õµ²\ã!\"(\å\r“Ã„ò(&¨X\rc§¢\Ôúb¾\Ó ž3Ù¸ý×²~k7¢Fµ\Ì\æ\Òc¸¯£†B!u¶\Ô\Ún3P\Õ\Æcžp¸\Ñöc^·L^]k¸J\áo­ I\ÄRwq\Ï5»\ï~\Þ\ËrºŠ\ÕN_QqT\Æno\â÷®CEUU]=+\é\Þð\Z9\ç(\'s\Ðæœ‚2Š¹c,0OOb †¨\æx\àcd>$“@DD\â¸\Û(î´¥®¦ŽxÕnBö¢\r~Ë£l:~W\Ël¶ÁO#º½£ŸÀ¬øUDD@DD\Â\"›¢kšZ\æ‚Py¯œtô\Ù\ì)\â‹=x\ZW¡PTDD@DDD@DDD@DC\Ñq…\Zý 5,W+ý-š	8™B\×:P.7@»Ž·\ÔôúSLU\\§p\âkba\ê÷ž€(cr¸T].3\Ö\Õ<¾iž^÷‚\ëU\×+­%-.’y[@ó*qY\è[lµR\Ñ3\ìS\Ä\Ø\ÛðQ÷`´ˆ¸]\'\Ôq\r/±N\\:\É\ÞG¸~ªG5¼#\Ê‘‚õT\Ê;}K\Î<?•\î\'r­\ëÖ´\Öm+5¢)¸W43§›Y\ÞJ¹Q\'mQ$§—‹¾g+½ú7Q<E{®-ú²c„9®Ãž<Ô¬\Ø\Ë,¶¾ŽI\ã,’²wO‚9ð\àú8tUA\Ñ\ÈUD£}ô\×\Òú>;Œ\Ô\Û\ß\Å\Ëý™\äT[$‡w…=ª!eD.ŠF‡1À‡\ÞC\ÜýS¤5-AŽ‹mC\Ë\é\äÇ²3÷}\ánÙw¢Ó°Úª¥ÿ\0:Q3€‡rG\Ü\ï\Ùu%\ì7\Ê\Ý;x§¹\Ð\ÈY<.\È\ÇB<\n”Z;wtæ£¢ŒVVEA\\õ\Ì\îžò	äƒ¢>6½¥®h-#õ‹¦\ÓVJ:\ÇU\Ó\Ú\éb\Ç%\íˆ•\í¤¸\Ñ\×3Š’ª\Û\ãÃ¿E}C¸a‘\í\Ða\Ç\É\í­´åŠ­´·½5<\Ä\ã\Î\æ=\ë5E[Â™•4³2h$dŒ9J_ªæ­¿\×\ÔT½Ï•õ.\'\ÞWyôx»\ÍQi¸[$º(Iû9êƒ¸¢£z* \"*\n¢´¼vPPœ ª/Œ•0\Â–VF	À\ãpù¯ {\\2#\ÉÈˆ€ˆˆˆ€¨z*¢\í\éU[ô•¢—\Ú}‹ž<üþË\Ù\íu»µ=º–7I<\ïhh\ç\ïSSQ\é‹^¨·š+¥3f‹»¸q\îX½/·ZwH\É$Öº2\'.\ÖGq8\0{dt¶Ÿ¦\Ó6\n;]3@l,\Çñ;\Ï\Íg0ª€ˆˆˆƒ\ÏY?«RTNFDQ¹øñÀÊ„Z–ùW¨oµW*\Ùù&	\ä\Ö\çJp\É‘Žc†Z\á‚<A\\6ñ\èòÊ»Ì“\Ûî¾¯G#Ë»\'³‰\Ì\ÏP\nW¶ú:}_ª €\Ä\ãE„•\È4Ÿ1) Žžá‰‘±¡­hå€°šSI\Ði,v\Ú’\Öó|ŽûR;Ä­€ ª\" \"\"\" \"\"\" \"\"\" \"\"À\ê­3Cª¬uºöƒ!\à\æ;\Äy¬ò¦PB\íg¡.\Ú:\ë-=T’›‹1Tµ¤µ\í÷÷-_ˆ·\Ù=<\Ôñ«¡¦®¦tPG4N,{As«®\Æi+•K\çk\'¥s\ÎKav\0A\Ã6ªûs·k«l4o‘\Ñ\Ô\Ê#– NOS…/\\\Þ6žñ…¤i«\Óú>©\ÕtM–j‚0\Ù& –û–ò;ª©M«º\Óü:§Ì®¡\è\ëV\Öj[•1\ë%8#\Þ\n\Ó7j„P\îU\â00\×H$\ï\0VCd+\åQ³ºv>?\É¶U\ÑUc/÷Š{–ª\éSžÊ…\î©ò&´Ù…\Óm¥\ä4\àˆ>\ì \ã\îô†½ý0dÞ¡\Åü.|E¾ÿ\0 \ìWŠ{õž’\çJOcQ{A\ê<”\ïR\çd\ä2í¸—dµ\Ïoæƒ¢\"\"\" \"\"\" \"\"²W0¸÷U\ë\ç8\'g-#òA\r5Þ­¹_µ]|óT\Ê#d\ÎdQ‡œ1 \àavƒ\Õ·{Mm²ºg\Ìi\Ó\ÞrxOvTz¿³ƒQ\\[Œb¦OúŠ\ìÞŽ\Åe\å¤–°\ç\æ‚B…U@ª€ˆˆˆ€…š¶¶\n\Z9ªj$Š½Ç ©A}EL4°¾i\älq°q9\î8\0-\ë½z2\×9„\Ö\ËRðp}Z>1ó\\Gr÷F³V\Üf¤ ™ðZ\ì1€eór\æ\Ä\äõ\ä‚\\Zw«F\Ýf\ì…l´\Î\'\0\Ô\ÅÀûMW\r\\-š	Y$Nk\Ø\àAø¨‚Vß¢÷ó£«˜\è¦|\Ô}L÷e¤yy ™`ª¬•\Ô\ÔZ®\ÇÒ…Ç³{LwVðVu2€Š\Þ%\\ ª\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" aE\ßH\ZO­\á©\rÇ¬S‚O‰–—·uo¢\Ü,¬8qªc3\äN\n\é>‘\íL\Ù\ÜÉ\Ùù®K¦$1j›T\êÚ¸ˆÿ\0ˆ œ­•rµ§ ®@Z\Î\àSúÖƒ½B’\êWò[2ñ]i½r\ÙSMŒö±9Ÿ0‚‚T¤\Ø\nž\ß@:\"O\ÔÔ¼s\î\äc¹@i®uT\ç¬R½Ÿ\"Tôr«/´]©\á\ìJ×\ï;š\" \"\"\" \"\"\" +$û8Wª;\è ö°²\ÖWvc«/Šê¾Ž\Å\æ\ê\Þ>F&ò\\\Ç^0³^\ÞÁþöÿ\0\Õo¾•]ž³ª§bZc\×\ÄttUTP*ßŠ\êú]YH^Ø¦™¬\ÍüuU\àºÚ¨\ïT2\Ð\×ÀÙ©\ås9^e©±D\Âù\î´d•#v\ëf-”–˜«õ©®˜q$>\Ämð#¼­¾É´ºN\ÃsmÂ’„ºv;‰†W ·r\íO²\Zb\íI,–\è>Ž¬\á%†#õe\ÞmðQžÿ\0c¬Ó·š‹et|;…\Þw\äT\êp\Èæ£·¤]žn›¤m\á’v¾)1\ßÃŒ\Z\î\Ê\êùìº¶\\õPW\Â\×e¯=’•M9h*Zj\Í\rÚŽ¬g\êfkþD)\ÏA3jhi\çh I^>#(=\'¢Ò·7Z¥\ßUšk¦=;O>}\çKts†’Š›×¬#\ÔZ¡´4’ñ\Ñ\ÐÀ{‹û\Ê\èj\ê;¸®š‰s\ã{²\Ã\å….,Wv³\Ñ\\\0-õ˜/	\î\ÈP³L\Ù*u¡¢¶R\Æ]$ò\0|›žg\ä¦\å+(©!¦‰¡±\ÄÀÆ\Ü\0\ÂJ\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"/œ’\Ú\ç9À5¼\ÜOpñA½!n£X\ÒÑŽ)©\Æq\â\îkhúgVkDi%\Õqôþl¯n\à\ß¢Ö—K†G¦,…¼‡\è¶-Ž´›†\á\Ó\Î[˜\è\ãt®\È\åœ` –-\ä0®V·¢¹Zþm#\Äa\\­r9« õ][v„óàªÌº£µh‹R\\)I]@÷sZ¦\ë\éš\ë6º¸\Í,\Zj©L±J\Zp\ì­\Ó\Ñÿ\0K\×\Ü÷é¢’*h\ã10½¤q“\à‚ET‘Zþ\år£C=Ñƒ\Õ÷\"ö\Ïüþ/˜Y½Œ©û‘L\Ïö±=Ÿ’Ý·wj®·{ô—\Û$\"§··„l;\Äy/¶\Ðm]\Ò\Éxû\Ô^¬ø\Ú[\É$õ\'ÁuUETD@DDD@DD\Ñp\ÏI4Y\ì­?h\ÌòÀ.\äz(ý\é#T\Ó=Š—ˆe­’B=ø84g4§M…üVsˆ\æi£\åþ\èPv\ßLúË…54jYZÁñ8S\"ù¨\è4>‘Ž¦ºA˜)\Ú\È\âÏµ#\Ã@\0 \Åî¦·‹Hé‰„Oo\Ò5M1Ó³¿ŸW{‚ˆ²¼\Ë#ž\ã—9Ä’{\Ê\Í\ê½QpÕ—©®Uòe\Î\ä\ÆŒop{´Š«Öº”q3=ª‰±É­þ¥Y\Ø\r\è)&\Ô\ÕL\átÁ\ÑSº´\ïŸ%\Ý\Âñ\Û-\Ô\Ö\Ëe5+`‚1^\ÔD@DDD@DDD@DDD@DDD@DDD@=>\Þ\rHý9¡j\Ãj*œ \'Ÿ>¤|@+€zG\×}mŽ€w	%?8 %\ï\É\ês\ÍJ=‹\ÒÍ´\év– *®¼8Žb>\à£=ž\Ü/4Tc¬ó¶?™Âœvª\í¶ºj(@lPD\Ø\Ú€=ƒ¢eZç†·$¯;ªI\Îµd×«!2<Wƒ\Ù\ÏN\'g<EMk\Å}ª¨\é«ÁSO\ÍŒšú\Ãp02&5ŒF\0ø/ƒex\êy/K2T¼Ø½ª\Ó\"\" \"\"\" \"\"\" ¦U|\äwr‚\â\àÞ§\æj#ñ^g9\Î\ê­ù,\ë¤\á\é5,2©\ë=1\æ¼øUøe5|=Œ;¡W\åx\ZH9\Æ¦)*\ë=sº*!*°ª/™•¾!cnZ’\Ïh\ÒWÜ© kzñ\È3òA“{€a$\à¤÷(‹¼\ZšG®ªø\é©«\Æ\àz\ã©ù­\Óq÷°W\Ò\Ëj\ÓNs\"x-–¨Œ˜j\á®qy\É$žòPe´\ÅÆ’Ï¨\è®5qºXi¤˜\Û÷ˆ\è>kÓ«u…\ËX]å­¸J\âÌž\Ê}˜\Û\Ü\0ýÖ½Þ³ZkK\\õU\Ú+}¶H÷\Äü{,\ä”\r†\á¨n\Ð[­\Ð:Y\åvFŽò|—\ÚE\Ñ\è\ËtP¾¡\Þ\Ô\Óc\í»ú/>‚\Û\ën‰·vPµ²\Ö\ÈmRG´\ã\à<\Ü\Ãp€:*¢ \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\n}!\êýgC,e <#»%I§t*,\ïû¿øŽžBŠ/\Ý›·ñw\ÆÁŽul<ý\êk4\à(mµlneŒ\Ò|þELy¦q/#¸/šºF¸J|«5ß™ð\Â\"(\Ñð_H\ÞXó\Ë\r_<*g\É±o1•Udg-\nõ·ž|ð¯B±\í\âR¬ýx‘U\í\àw1òB09,»\ËñDT\'UE\ÑU„‡r@2\Ò,žŠ³\×_®\å\Ê÷§\\W\éK-55²^Ê®±Å½°\êÆŽ¸ó]M\Ç\r=\ê&oF¥ú\\\ÔS\Å\'-\Ô\ÆA\å\Ä>\×\æ´\à\Õ%\ÖZ’W8¾ûpq<\É3¸~\ëS]SY\'iU<³?ñH\âJó¢s\Õ\0Ê¹Œs\ä\rh$ž@c+¯\è\r“­¾6+÷´£ >\Ó!#\ë%°÷ \Ót>\ß\Ý5¥\Ò8i\Ø\è¨óõ\ÕNi-h©R«Jh\ÛVµ²Š\ÛOƒ\ÚN\ï·!ñ\'öY;=ž†\Én†‚\ßN\Ø)\âk\Z?_5‘\îA@<\ÕQPôQ—\Ò\ZŠHµ¥\rQ†z@\Z”Ÿ\ê¤\Ú\âþögUiº«\0þ\ç1cùs\áx\Ç\êpqmg­y\Ãb©a>\âqû©µ`sNC€ ø¨­sN\Ò>L½·\Ôj\rnªdÒ²1Àža\í\äPló°ž}\ËÎ½\ßhs_Á\Ï-6:s\Ö~¼\è®,p<Â¡TtØ¢\Ìe\\#y\î^ˆ\á\r\'\Í1žº^Á†\á^¨V\ÜDD@DD\áx®7*;e+\êkª#‚—¼\à/[þÏ‚ŠûÕ¨®U\ÚÚª\Ù+\äe\'dYÀ<º \ê÷ø\Ò45†9*j1÷£\Ùø›Ò»¥¦µm@¤¢ªtu\'“a™¼%\Þ\ï\Ï0<x¬þŒ¢¸Wj»dVÆ¼ÔŠ–8ý\ÐI>X\Ê	¸\nªµª\äNª¨‚\Ç4;‘\æ`\È_l&9¬\â\Ëc\Ï\ê\îñ\nž¬\á\Ï!z‘<ž«\â\ÈCyžk\ë€\Ñä‡’ó\Ö\ÖACG-MLŽš^÷¸\à\0·ZŽ\æ\ë8ô~•švk*Š¹û\Äuø({4šW\È÷½Çˆ¸÷•¸\îN´—X\êiª\ç\n\\YL\Âypø\ã\Íb4†›¨\ÕZ–’\ÕNÖ¿\ë&3¼ªl7i)á–\ê—\Å0\Ìnld‡·é­¡\Õ:…\Ís¨\Í?|µ\Ï\È)Uk´R[mt´0DÁ<b6\Ñ\Ðw¬€Œ\à„÷D\í%“Iµ³K+«ºöÒ°{ü!t01Ü®DD@DDD@DDD@DDD@DDD@DDD@DDD@DD‰\Ôzkõš®\ÝRÀ\èçŒ³˜\è{\Íe‘½\Új,7º«uKe§°\çË¡ù.ƒ²ú\Ø\é\íF\Ûed¼4¤7$òcû\ì·mô\Ð\"®Úš\ßTd\n¦·Ÿ;ðQ\å„\Æ\àì–¸ƒ\à‚{°û#š½r\ržÜ¦_íŒ²\Ýj\0¹Á\ì\Æ÷s3½u\Ð|\ÐT€©\Â<È‚\Þr\"\" \"\"\" ¡\æ´meµ¶=gRÚº¡$``\ËÁpó[\Ò \ç¶=\ÒŠn\ÎKx¬õ’§\Ú+lµi›-”—[m”Ô®wS\0?5–DÂª\"\" \"\"*d/-}Æ–\ÝG%U\\\ì‚\Æ\\÷œ\0ƒ\í4¬Š7=\î\rkA$ž€(Ï¼œoõŽ²Z\'p·Bq,8\í\á\îWn~ðM|t–›®†\Ý\ÒYšpé¼¼‚\ä¥ò{#$žCÄ ¾\ß<ÌŒ/{\Ü\ZÖ´s$÷)aµ{}²²z˜ÁºU0:gü1\Ü\Ñû­Cfö´\ÒöZŽùN;SƒM\Ç\Ø\ï\ã>kº´ò\0*¢ \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" ø\ÔAðI­\í-sOB\nŠ›«·i[¼•ôq9ÖŠ‡q1\Ý{\"~\éòRÀó\Çr¶R]he£­…³S\Ê\Þ\Æ\áÈ„^–®z\Z¨\ê)\å|sD\î&¹§!v\ç{a¸º+V¤s)\ê]†GT91\ç¸;Àù­3qön³O>k•‘©¶i\Ì\ßõ”g‡¨\çú ž±H×°8ZFAñ\è¢v\Ýë®••´µï’¾\Úyvov\\\Ï\å\'ôRSMj»N©µ\Ç]k¨lwÚ>\Ó3È¨Óª€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ\nÇ¼1¤žK\çSQ-;\ç™Á‘F\Ò\ç¸ô\0’£\änýv£©}¾\Ñ,”–\Æ8\Ø\ì>_<Ž€ \ìz»w´\æ•‡¶õú\Þ\è)œ\Ì\îG]k¸—­iT\ãU1†Œ«¦Œ\á yø•©\çß•œ\Ó:B\ï«.\r¤µÒ¾_\Ç!c‰(0\ÐC%DÍŠ8\Ý$ 5¬$ø\0»ö\Ö\ì\à§^õY›<PÑ¼rowš\Üvój­\ÚBYª\Ö\\\Ý\Ög7\"?&\çõ]H(\Öp\ã\0x+\Ñª\"›\âc\â¨=\ën6\ËR\ß®:v(i+¹—\ÃöY!ò\îvUB2A;½š¾\Ç]%Â™ðNÃ‚9q\ïW\Ù/\×=?^\Ê\Û]d”Ó°õa\äG˜\ïSS\è\Ë6¬¢u5Ò‘¯\å\ì\Ê\ßqQ\ëZ\ìö\Ã$•ˆr·\ä¸vc\ë#\âÿ\0¦\ß\ê9`Ž›SF\èf\é\ë7\Ø>d.»jÔ–‹\ÜB[uÆž¡§ð¼g\ä \ì\Ð\Ë®ŽX\ÞÇƒ‚\×ð_JjÊªx\éj%…Ãžcy¢	\èUT>µo³µ5¬e\Ô\Ïû³·n‘wX€Öªyü]‹O\É‘E\Ã\âô³ð\Ö\É\\Ž|/i__ò°÷\Ùnñ1kE\Å?\Ê:ÀzY\îý\æÿ\0Uò—\Ò:\Î\ÑõZ\×8õ\ã{@A\ÜG:¿HÛƒ‹…%’£\îd$~\n·uuKa4”\Ù\ïdy#\æ‚T¢\á»/¯®ú’õ_Iz®’¡\åt`€\0ëž‹¸ŽQDD»}os\ÚtaO!d•³r\ÝûÁE\\\ç¯þ\ÊCúH\È[h±\Å\ÜgøB1)\Z\ßæƒ½\í¦\ËPV\ÚioZ„:aPÁ$T \àžœ^>\å\Üm¶šMt–úH© \ì²6\à,5VšÓ¶º*K…æŠÌ\Ë({#¹|\Æ\è\èr\ìi­ÿ\01û \Û@Âª\ÂRk7\\3M}·\È<ªýVN\Z\êZ†ñAS£Å’ú ô\"·¾)\Æ\Ü\ã#(.EL…\\ \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" +\\\Î.õr Õµ\Þ\é½P\Çý#nŒ\Ì\áŽ\Þ1\Âññ\\¢ù\è\éÌ¾\Éx\å\á\Õ7™ø… 8Bwt\ÚMel‘\Íu¦I\Ú\'ÀxZ\åNš½\Ñ¤\Úk\"þh\\§7µð\Ç \Ã\Ø\×1”)\ÐJ\ÂC\â{q\â\Ò¼üù)\×-’\×8ú\Û}3ýñ7ú/öv\Ê\Ä-ty\Æ?‚\ß\è‚ðŸ\ç\É^\Ød‘Á¬cœ\ã\Ð’¦sô¦Ž¨—\Û\è19 \à~K\ÛK§ôõ#ûzz\n&8}\àÖ”\Ê\r?xªplº¹	\é\Ã—\Â\ák­µ\Î ®¥–žR2#H8ñSz¢\éi¡o\×U\ÒEŽg/hQ\×}o[\Í\Ö\ßQj­Š¢h\Ø\è\å1œŒu\Ð`vn\ê\ën\àQ08T;³~T»oEô\ík\íÚ†\ßX\ÂŠ¡ŽüÂœ”òv\Ôñ\Ê>û¾a\ÕôD=pOI7t°\âJ&®ÌòH\Æ~ô“\'°°\î9F®Oþ‘<~¨=wY«%ºTIZ^jx\Ï\\¯OB˜\r°\Òz”C[q¶qT>6—I…œGKQ°ú&Vž\nz¸	\ïmA\åóA¼€+\ÓKr­¢x}-TÐ¸w±\ä.¯¸:Bhúr\Æ\\\ë\ä¸³L×µ\Øþo\0¸ó¹\ÃÓ»(6\Ê\Ì\Ö6\æO~ª\r\Ï!\ÃóYú=÷\Öt¬\á–zZž}e‡Ÿä¹¼q>G†1…\Î\'\0Ôž‹o›l5l4±Oô-C\Û#C‡\É\0ø„Í¿\Ò.ò\É\ëÖšYc\Ï>È–•\Õô^\é\Øõ“½^\ZZ\Ð?\Ñ\æ#\'\Ü{\ÔN¸X®–³ýú\ßSN<dŒ€«c¹¾\Ï{¢¸1\Îk©\ækò\Ó\Ï\0ó$­:\Éx¦¾Ú©\î4r\Ã;›Ž\ï%‘@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@ZV\çj:/¡k\ë\è\Î*\Ãnü%\Ç[“\Þ\Ö4—\02IQƒy·Ú†\æûº`m”¯ö\ËOñ¤þ\á\Ñ0ª¹\×UTºyª\ç|®$—ºCœª¥À7„WUø	\ÕyOUµh-\'M¬¯ŸD\ËpR¾2\è\Þ[\Å\ÄGw\É³%Lòœ\É,>.y+\äTŠ¦ôs·\Ç#S{šFnkc\á\Ïæ¹–\éYtþ›¿6\Ëf§•²@\Ðg–I¸‰\Â\r\"{Fùú©Ï§]¦\í¤’Oª\Ç\ÏýÐ¡%ž\ÙQwº\ÓPR\Æ_,\Ò´8­4¦†\ÑGJ\î°\Â\Æ€=¨ˆ€‡¢*\É	ô“c¾Œ±?´M \Î<‚’$ið ©\'\éÆ»H[_iµ˜¨\Ô9f}Ki°\é\êjË|ñöp\âxË½‘\Ðu+„k}ô¹\Ý_-Ÿ&Š8\íñõ°\\š®¾ª¾A-]D³½­\ri‘\ä\à\Ð+h\èj\î-§¤‚I\æwFF\Ò\â~H-ªªž²wM<¯–W¹\ïq$üV[K\é{–«º²\ßm„¾B}§\ã\Ù`ñq\î]E\ì]\Ö\é#*¯ù ¤\ä{õ¯J@i\Ý-i\Òô\"’\ÓD\Êxñ\í;«\ß\æ\ãÞƒP\Ðû?eÒ¬Ž¦®6\×\ÜG1,öX\ÂIkp1\ÑTT\Zö´·\Å_¤n‘:H\ïV{›–ry(I&xŽz÷©\ãsgin©ñD\áù.q.•P‘‚\É\\\Ü|PIG«„µZ>¶–G\Újœ3=Á\Íö]…G\ÏF\ê—z\Åî“ˆðð2N<\ã*A„D@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@T\'\n«[\Öz¶GX&¹Uœ‘\ì\Å|Ž\î‰½{„,6\Ãb·\ÌÂ©¿X\æžqFr£w²z¬•þõU¨ouwZ\ÇqKPò\ïp\î\å¸mF€“X_\ÙSS…®‘\ÜS8ŽOw,0 \Ö\îZB\ék\Ó\Öû\ÍT%”Õ¥\Â<Žc	÷¬}š\éQf»R\Ü)žY-<\í ùó%-÷KC\ÐU”\Â\é\â\ã¦k{‹G >\n<<´\äpB	\Ía»\Å|±\ÑÜ¡-s*\"kùwxšŠ;\Å\Ët/ülÿ\0¤.µ\èû¨Ÿ_§\ë,²‘š\Ç\âX\ìþ\ë—\ïu7«\îe{±üf²AòAô\Ø\æDw&“´\0¸Fò\Ì÷)fÞCýžœA¹v¢IÃž[ù)‚Þˆ*ˆ­qÀ@s\ÃA\' \\\ã[o\r‹K²ZZi_q”g\Ùaÿ\0\èµ\r\èÜº\Ê\n©tÕ¦N\Í\Ü©§\Úû£ÁG\Ç9\ÏysœK‰\æO4.®×—½eP\×\Ü\êI…Ž\âŽrc>+[Š\'\Ìö²6—<œ\09’VÝ£ö\êû¬¤ã¢¦1\Òqa\ÕR0{¼J‘\Z/i,\ZL² \Ækk\ÇúùG&ŸðŽ\äDl…\âüc«¼ñÛ¨\\2\ZG\Ö<{»”€\ÓZ\ZÅ¥i›¶‰Œx\Ô\Î{¾+akF2¯Ak[…\\yª¢\" ²A\Ä\ÂC\ÉB]s\0¦\×ˆ€ÀmSð>*n;§5\r·ZO¹W–†^/˜Aºz:T˜õm\Ê\é)ø‡%GzŠû	V\Ø7²\Ï9\é\ÜÁó\Ï\ì¥CNFPU|g•D\édwœ\ã\ÜU·O]É¬u›-·Ò’\ÈYœñ÷|T¦\Õ4S\Ü4\ÅÊŽ™\Ü3MNö0ù‘\ÉB:ºI©*e§¨c™,n-sH\ï@£Š)\ê\âŠi„1½á®‘\Ý\Z;Ê’š{q6ÿ\0G\Ø)\ít71}¢\Ø\Îdq\ê\ã\æ£\\“Þ‚OÏ¿úMŽ\ál5ÿ\0`\Çê£¾¨ª¶\Ö\ê:\ê»Kdm\Ò\Ù\Ï2>yX~iŽ‡(:\Í^M£rm\í\É\ì\ë8©ž3\Ë\ÚÀ­‹\Ò‡±Õ´5€OO‘\\\ÇLV‹v©µV9á­†®\'¹Ç \Ã?’\î»÷5\ÛIÚ¯’\Ç3\"˜·‡#\Õ\rÒµ†ƒUZª‡úº¦;á§nc\\:8	†WC;$aÃ˜\à\á\ï\nn\é¼w\Í%k¸\ÆIS´œžð00ƒ8¬yÀ\É<‡Ux\æµýms}›G]n\ãŽ\nw9¾þŸº¯ºuôWÂºOD\\XÀ\ç÷D­/Jùet\Ó>G’^ò\\Iñ+©m\Þ\ÑÃ®4\Ì÷)n\ÒJ&1Å†q„\Z-‹V\Þô\Ü\â[]Æ¢˜\ÚóÀ\ï\"d\ÒÞ-žª*]AodLv\ë0\Èø–Ÿ\Ùs\íW´Z—LJ\ç6œ\×R}\Ù\é\Æ~c¹hnk¡yc\ÚCÁå‚‚yR\Ô\ÅUMDl‘Hšö‚zô(ÿ\0°\Ú\í\Å\î\Òõ\ÒÈº‘\Ä\ç\Þ\Õ\ßÁATD@DD¸¢¦ú\ÛýKp\åœr0µ\çôRµGÿ\0H\ëQ\í-7F3#ŠG\î˜A\Í6²½¶\íÇ³\Êã†ºnÌœøŒ)Î…@\Ú\n·\Ð\Ü)\ê\ã$> Ç‘Ê›šfùK¨l4—*I\Zö\Í\\\ìmv9‚ƒ2ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆ¾r\È\Ø\âs\Þ\àÖ´d’q€‚®\ê\"\Ý:¾¶qOx·AYupö\"ˆ\á\ç\Í\Äw,f\ä\ï[(x\ízbv\ÉSÍ²\Õc-É¾\'\ÍGÚªºŠ\ê—\ÏQ4“Ló—I#‰$û\Ð]_<UU’\ÍOL\Êhœ\ïf&CGp\æ¼Á®$r\Éð[6’Ð·­aZ!·R¸\Â\í*0\Æþ~*Fhý›ÓšlG=L\á^\ßkµœe­?\áoDM¦\Û\ËUFˆ‚¢ýe‚Z©ds\ØfgµÁÜ±Ï¶ô\ÐZ©®zz\ØÈ›O‘<p7¨ü_\ÞXÀÆ†€\0\0*>&\È{C Œ\ä $d\ã¢ô¶\çZ\Ú\'Qš™=Y\ÄÈ¸–\äy)W©öcJ\ê¾¢\Zso«vI’›“Iñ-\è¸Æ±\Ù[ö›†Z\ÊB\Úú&s.Œa\ímA\ÌZ\îjFz?\ê¡Ui©\Ó\Õým3»H=Xz\î*9¹¥§}\Ë1¥¯\ÕZoQQ])$-’A#¹\Í\èAøe\ã\î\\\ï{.\r¢\ÛJöª\Ø[\ç“ý¢·wtu\Ù\×V—¹ \â&—p\äw•\Â÷_r¿¶u‘P\ÐqM3Ë˜\\9\Êÿ\0\Ä|sBròT»ÙŠ3I¶®&\á\Óq\Ê|ò\ã\ÉD\ê\n	\îU°QÒ°¾y\Þ#c|\\y6´Õ¨Y4\åº\Ø=Z‘ž}\àsüòƒ*\æ1\Ë—5·\ßF²\Óy‚÷CN#¥¬öe\á\è$÷weIÂµ\r\ÉÓŸ\Úm_CA­\í¡\'ñ7š‡dºOd»\Ò\\`w”ò‡_\ÉMm?w†ùe£¹S»Š:ˆƒÁð8\æ9¯-vAI/G\ÝJ+lU)d\Ì\Ôn\í#ý™ÿ\0ºÒˆˆ™_\ZŠ˜©\át³H\È\ãhËž÷`\ïAö\\\Ï|m\æ·n\ê\åhÒ½²Ÿvp¾úƒy´ŠCj\Ý[0\å\ÃN8€>er}g¾zŠ‚ª\ÕEA˜\Þeöžsú \ã\ã‘]‹cu­ºÁU[kº\Ôú¼uEŽ‚GŸa®ˆ>\\t¯aÁ>\'´Ok\ãk\Ø\à\æ¸\Ò9‚\ÑG\r©Ý¹hj!±\ê\n¢høx!¨\ä°÷\"ã‘²\Æ×±Á\ÍprAôDDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@Bp‡^;…Âš\ÝC5edŠžñ½\î<€A[…Â–\ÙI-]eC ‚&ñ>Gœ\0jÜ\âª\Ôf[]™Î‚\Ù\Ñ\Òt|\ß\Ð,6\æn]V±º>ž™ÎŠ\Õ\áŽ0‰þ\'E \Ó\Ó\ËS;!…¥ò=\Ü-h$ù7\çu\É+«m\Æ\ÎWjW2\áyŽZKh\æ\Öô|\Þ\ï\0·¶\Ù6\Ñ:+¶£’~NŠ“¨o›¼O’\íñ\ÂØ€k\Z\Z\Ð9\00x\í6Š;-º\Z\Z\nvCM\rkZ1ÿ\0º\È\n¨ˆ‚Š\ÙX\ÙXö‡4ò ø+\ÑgÞ½»m–·\éû\\DQT¸ö\ì\"ˆò+C¹)\Ñ²\Ò\ê-U®­¹†¡…§A\î*:Wl¤Š\ìb¥žšZB\îS½\Ø y„‹Ÿz¾(dšV\ÅùpÖ´d’¤½·\Ñ÷NGL\Ï^ª¬šrÁ\Æ\æ<5¼^Ke\ÒûI¦t¥p­¤ŠY\êG\Ù}A\àó\Å´S5šHµ\íœ5|$\Ó\Óž\Ì¼\ï5\Û\Z<‘£\rÀ\ä®\Â²@pFA\äB½Q\Ã!7\Ý-7ýš\×w\nX\Ø[M+ûx|8]\Ï5M¯Ô¿Ù­yn©’NÎ–Wö»\Ýÿ\0‚»vûiSx\ÒÍº\Ó\Å\ÅS@\î\'9º3\×\ä£~­ÁÃ¨9A=¢‘®o ´€AÊ¤\Ó\Åå‘¬kFKœp‹ºc|\ïv;g¨\Õ\Ó\Ç]qðÀ\çœ9¿\Ì{\Â\Õu6\âj=U)5õ®d]’\Æ‚	\rª÷ŸNiè¥ŽŽO¤ª\ÚqÁö\Z|Ü¸&¬\Ý\rE«„‘T\Ô(\ÜyS\Ã\Èc\Ï\ÅiÑ‡HxG2yc=VË¦6÷Pjª¦\ÇCFöCžu´ˆ\ÇÇ½¬A\'[&\ÐÚ‹SL\Ø\í\ÖÉ\ë3\Û\ÂÀ<xŠ\ïZ?b¬öY\"¬»\Î\êúÈ\ÄŒD»©ø®±\r<pD#‰cFµ ðAË´–\ÇX,‚\Z«›]p­nxÿ\0†\Çyÿ\0Š\ÔwkhûM¨l¸´»Š¦•\éþ&\ÙHLd‘‡ŒF#‘ANZyòò]\Ëh7[\Õ_O§/ržÁÇ‚š¥\Ç\ì\æ»\Ë\Í|7wj\Ýo’£PÙ£\Í+D\r\Ã?ˆy.&Zs\Ì „\á\0ƒ{\Õ\ë‚m\í	L\Z~ý!\í	à¦©q\ë\à\×\Ýw–»!Èˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆŠ\×[,Ž2÷8’OpQ{w·2mK\\û5¶G2\ÕNü=Ã‘\àõ>C¹n\Ûß¸?G\Ñÿ\0g-•\0T\ÍÎ©\ì<\Ø\ß\Ã\ï*:d\È\î\\\Ï_Šá§’ªvE]$pkZÑ’J”WµTºb’;\ÖKw´\Üó\ç\æ°û3¶m ¢‡Q]\éÿ\0½\É\íSFñü6þ,x•Û€A@À:v§=Ê¨„D@DDDAòšž*ˆŸ¬k\ã{K\\\×‚\Ö\Û\r<\Õ\Ó\Ö\é©#\Èx½RBAnzðŸ S!\Í\Ëj5}¦‹\Ö\ê-dÇœb7qð\nºojµF¥“\ê¨]MûST{ {¼T\Ä#* C9V“\Ø\Ý;d\ì\ê.7:\Æ\àýa\"6Ÿ\å~+¨\Ó\ÓCKb§‰‘FÑ†±À\ìˆ(\Zª\"uDAó–\åÑ½\ÌpÃš\î`ûÂ{¹µ³TT_\ìp\æ\Üó\Å4\r\É0¸õ ~\ÑI…ñ¨§Žª\Ã+\ãx\ás\\2A\Ø÷±\á\Í$\Ì¤F\Ïî¡¸5º~ùQš–ŒSNþ\îŸ?5¨\î\æ\Ø;M\Ô:ñh\î¶H~µƒŸb\ï\è¹<2\ÉO#%\åi\Ë\\\Ó\Ì‚{4\äuW.I´[—§ e¢\é0m\Ö\á®w.Ù£÷¬‡g’‘\nÓ·[\Ò\è½=-S\Þ\rd­si¢\ïs±\×\Ü\Ñ_]\r¾Žjª‡†C\Þ\ã\à:¨u¸ZÒ£[j9+8i¢\Ìtñº\Ìþ¨5\Ê\ë…EÆºjº™$ó8½\îq\êJ\é;=·\ÎÔ—¡u¯„ýH\îþ’\É\ÜˆM\ÑzR«Xj\Z{e0pkŽf“£oyS\ZÁd¤\Ó\Öjk]8i\à`k|üO½F(\ØÈš\Ö45­À/¢tDD@DDD@DDD@DDD@DDD@DDD@DDLª¯S\Þ\Ù	l¬gF3\ÔdŒŸ’j¢ð:Yxg{j›YhöŽ	\ÏE|Œ¾\"\é^q\Ù8~8A}mô’\Ò\Ô\Ä\Ù •¥¯cº8÷Cnj4m\Ó\Ö)˜\é-S»1H>\áü%JVv±ö²‚\\÷:S\È\ç*\ÝGg·\ß,³\Ñ\\\é\Äô\ÎnK	Á\ÏvrIC_Sl­†ª’WE</\âcšq‚¦\Ýk(5Ž™‚¬8\n¸\ÇgS\ê×Ž§‡\ê;}V›ž\çK=M)õ\Ç#­¬·³Õœ\Éc\ã>\Ñw	\É?žW¿l«¦µ½úš‚†¦jXš\é&O\ì\ÅÁkKKN]\ÄqœŽYðA$²‹OZ*\ÙLn\â\Í\Ìe£!ü³|<\ÒIŸÛ°2R\Þ&—¹™\çù|P{c\é\ê*3\Zó_“Ž`g\ï@DDD@DDD@DDD@DDD@DDD@V=\ícKœ@žI\äªó†•\Ã÷¯rEôÕª Š§¤\Ê\Ãöø}\è1»ß¸‘Ôƒ¦­!\Ì\ëW,n\ä|žÿ\0¸C\Z\é$k	sˆ\r¼£‰s‰\ÎJ\ì;%·¢õrmþ\ãh©õ,p\å$ž>\àƒ¨\í„þ\Éi\ÞÞ©­5Õ >N\\\Ø\Ürj\é\rÁQ£\n\äD@DDD@DDD@DDD@DDD@DDD@DDD@^i™,“± D=§<ãŸ€ó^”A\â–\n‡±\í`ŒY\Â÷p9c^‡7‚0D}£š!ŒŸšú¢=,<\ì1¡ü\Éq“•õ•‚H\Ü\Â9…z ç»“`¸\Ü\ìµ6–8W\Ä\Þ2od¼ù\çžF2<o°\êº\ë=ò	+¦ŠZ¨Ig,—L^\Üñº9ò\æ|T\Ðp\ÎF‹›Õ \ä°^\Ýy£ˆ}kòx\Õ\ÈzqA´ì¦´Šº™ºnºw\Z¾?\î\ïq<\ã\ËsŸpw\'\Ç3\ç\ãcZGL¸ù(1k¯¨´Ü©ë©žcž‰A\ï\ngh½QO«ô\Í5\Öÿ\0bFwµ\ã¨ý\Ðd©c’9\"\ÄR7\'\Ú.kG,<,Šˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆƒ©«&·é«•e9hi\Þö:9(C]YQp¬–²ªC$ó¼½\î=\äóDAñ¡\Ïh=\ä7t•¶–Ñ¦-´”qðB\Êv\àx’:”D\ÔD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDDAE¬k»]%\ÛD\Ýi\ë\"°{ÇˆsFAˆ!c‡1Ì®\ë\è\årª5÷{a“4½“gð~qŸ’\"	\n:TDDAÿ\Ù');
/*!40000 ALTER TABLE `admin_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_info`
--

DROP TABLE IF EXISTS `class_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_info` (
  `class_id` varchar(10) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  `class_credit` int NOT NULL,
  `class_room` varchar(10) NOT NULL,
  `class_capacity` int NOT NULL,
  `class_start_week` int NOT NULL,
  `class_end_week` int NOT NULL,
  `class_current_enroll_count` int NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_info`
--

LOCK TABLES `class_info` WRITE;
/*!40000 ALTER TABLE `class_info` DISABLE KEYS */;
INSERT INTO `class_info` VALUES ('202001','å¾®ç§¯åˆ†',2,'A101',20,1,20,0),('202002','çº¿æ€§ä»£æ•°',6,'A102',100,1,20,0),('202003','ç¦»æ•£æ•°å­¦',3,'A103',100,1,20,0),('202004','Cè¯­è¨€',2,'A104',20,1,20,0),('202005','è®¡ç®—æœºç½‘ç»œ',2,'A103',20,1,20,0),('202006','ç½‘ç»œç¼–ç¨‹',2,'A105',20,1,20,0);
/*!40000 ALTER TABLE `class_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_record`
--

DROP TABLE IF EXISTS `enroll_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_record` (
  `enr_rec_id` int NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`enr_rec_id`),
  KEY `stu_id_idx` (`stu_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_enr_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_id_enr_rec` FOREIGN KEY (`stu_id`) REFERENCES `student_list` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_record`
--

LOCK TABLES `enroll_record` WRITE;
/*!40000 ALTER TABLE `enroll_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_list`
--

DROP TABLE IF EXISTS `grade_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_list` (
  `grade_list_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_target_grade` int NOT NULL,
  PRIMARY KEY (`grade_list_id`),
  KEY `grade_list_ibfk_1` (`class_id`),
  CONSTRAINT `grade_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_list`
--

LOCK TABLES `grade_list` WRITE;
/*!40000 ALTER TABLE `grade_list` DISABLE KEYS */;
INSERT INTO `grade_list` VALUES (46,'202001',2016),(47,'202001',2017),(48,'202001',2018),(49,'202001',2019),(50,'202001',2020),(51,'202002',2016),(52,'202002',2017),(53,'202002',2018),(54,'202002',2019),(55,'202002',2020),(56,'202003',2016),(57,'202003',2017),(58,'202003',2018),(59,'202003',2019),(60,'202003',2020),(61,'202004',2016),(62,'202004',2017),(63,'202004',2018),(64,'202004',2019),(65,'202004',2020),(66,'202005',2016),(67,'202005',2017),(68,'202005',2018),(69,'202005',2019),(70,'202005',2020),(71,'202006',2016),(72,'202006',2017),(73,'202006',2018),(74,'202006',2019),(75,'202006',2020);
/*!40000 ALTER TABLE `grade_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_list`
--

DROP TABLE IF EXISTS `school_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_list` (
  `school_list_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_target_school` varchar(45) NOT NULL,
  PRIMARY KEY (`school_list_id`),
  KEY `school_list_ibfk_1` (`class_id`),
  CONSTRAINT `school_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_list`
--

LOCK TABLES `school_list` WRITE;
/*!40000 ALTER TABLE `school_list` DISABLE KEYS */;
INSERT INTO `school_list` VALUES (181,'202001','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(182,'202001','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(183,'202001','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(184,'202001','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(185,'202001','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(186,'202001','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(187,'202001','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(188,'202001','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(189,'202001','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(190,'202001','èˆªç©ºèˆªå¤©å­¦é™¢'),(191,'202001','æ•°å­¦ç§‘å­¦å­¦é™¢'),(192,'202001','ç‰©ç†å­¦é™¢'),(193,'202001','åŒ»å­¦é™¢'),(194,'202001','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(195,'202001','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(196,'202001','å…¬å…±ç®¡ç†å­¦é™¢'),(197,'202001','å¤–å›½è¯­å­¦é™¢'),(198,'202001','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(199,'202001','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(200,'202001','ä½“è‚²éƒ¨'),(201,'202002','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(202,'202002','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(203,'202002','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(204,'202002','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(205,'202002','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(206,'202002','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(207,'202002','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(208,'202002','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(209,'202002','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(210,'202002','èˆªç©ºèˆªå¤©å­¦é™¢'),(211,'202002','æ•°å­¦ç§‘å­¦å­¦é™¢'),(212,'202002','ç‰©ç†å­¦é™¢'),(213,'202002','åŒ»å­¦é™¢'),(214,'202002','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(215,'202002','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(216,'202002','å…¬å…±ç®¡ç†å­¦é™¢'),(217,'202002','å¤–å›½è¯­å­¦é™¢'),(218,'202002','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(219,'202002','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(220,'202002','ä½“è‚²éƒ¨'),(221,'202003','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(222,'202003','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(223,'202003','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(224,'202003','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(225,'202003','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(226,'202003','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(227,'202003','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(228,'202003','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(229,'202003','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(230,'202003','èˆªç©ºèˆªå¤©å­¦é™¢'),(231,'202003','æ•°å­¦ç§‘å­¦å­¦é™¢'),(232,'202003','ç‰©ç†å­¦é™¢'),(233,'202003','åŒ»å­¦é™¢'),(234,'202003','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(235,'202003','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(236,'202003','å…¬å…±ç®¡ç†å­¦é™¢'),(237,'202003','å¤–å›½è¯­å­¦é™¢'),(238,'202003','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(239,'202003','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(240,'202003','ä½“è‚²éƒ¨'),(241,'202004','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(242,'202004','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(243,'202004','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(244,'202004','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(245,'202004','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(246,'202004','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(247,'202004','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(248,'202004','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(249,'202004','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(250,'202004','èˆªç©ºèˆªå¤©å­¦é™¢'),(251,'202004','æ•°å­¦ç§‘å­¦å­¦é™¢'),(252,'202004','ç‰©ç†å­¦é™¢'),(253,'202004','åŒ»å­¦é™¢'),(254,'202004','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(255,'202004','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(256,'202004','å…¬å…±ç®¡ç†å­¦é™¢'),(257,'202004','å¤–å›½è¯­å­¦é™¢'),(258,'202004','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(259,'202004','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(260,'202004','ä½“è‚²éƒ¨'),(261,'202005','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(262,'202005','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(263,'202005','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(264,'202005','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(265,'202005','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(266,'202005','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(267,'202005','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(268,'202005','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(269,'202005','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(270,'202005','èˆªç©ºèˆªå¤©å­¦é™¢'),(271,'202005','æ•°å­¦ç§‘å­¦å­¦é™¢'),(272,'202005','ç‰©ç†å­¦é™¢'),(273,'202005','åŒ»å­¦é™¢'),(274,'202005','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(275,'202005','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(276,'202005','å…¬å…±ç®¡ç†å­¦é™¢'),(277,'202005','å¤–å›½è¯­å­¦é™¢'),(278,'202005','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(279,'202005','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(280,'202005','ä½“è‚²éƒ¨'),(281,'202006','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢'),(282,'202006','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰'),(283,'202006','ææ–™ä¸Žèƒ½æºå­¦é™¢'),(284,'202006','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢'),(285,'202006','å…‰ç”µç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢'),(286,'202006','è‡ªåŠ¨åŒ–å·¥ç¨‹å­¦é™¢'),(287,'202006','èµ„æºä¸ŽçŽ¯å¢ƒå­¦é™¢'),(288,'202006','è®¡ç®—æœºç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç½‘ç»œç©ºé—´å®‰å…¨å­¦é™¢ï¼‰'),(289,'202006','ä¿¡æ¯ä¸Žè½¯ä»¶å·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§è½¯ä»¶å­¦é™¢ï¼‰'),(290,'202006','èˆªç©ºèˆªå¤©å­¦é™¢'),(291,'202006','æ•°å­¦ç§‘å­¦å­¦é™¢'),(292,'202006','ç‰©ç†å­¦é™¢'),(293,'202006','åŒ»å­¦é™¢'),(294,'202006','ç”Ÿå‘½ç§‘å­¦ä¸ŽæŠ€æœ¯å­¦é™¢'),(295,'202006','ç»æµŽä¸Žç®¡ç†å­¦é™¢'),(296,'202006','å…¬å…±ç®¡ç†å­¦é™¢'),(297,'202006','å¤–å›½è¯­å­¦é™¢'),(298,'202006','é©¬å…‹æ€ä¸»ä¹‰å­¦é™¢'),(299,'202006','æ ¼æ‹‰æ–¯å“¥å­¦é™¢'),(300,'202006','ä½“è‚²éƒ¨');
/*!40000 ALTER TABLE `school_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_list`
--

DROP TABLE IF EXISTS `student_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_list` (
  `stu_id` varchar(10) NOT NULL,
  `stu_name` varchar(10) NOT NULL,
  `stu_school` varchar(45) NOT NULL,
  `stu_grade` varchar(10) NOT NULL,
  `stu_mail` varchar(45) NOT NULL,
  `stu_avatar` blob,
  PRIMARY KEY (`stu_id`),
  CONSTRAINT `fk_student_list_user_login_info1` FOREIGN KEY (`stu_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_list`
--

LOCK TABLES `student_list` WRITE;
/*!40000 ALTER TABLE `student_list` DISABLE KEYS */;
INSERT INTO `student_list` VALUES ('201901','é»„æŸ','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢','2017','4546@qq.com',NULL),('201902','æŽæŸ','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰','2019','78637@qq.com',NULL),('201903','é™ˆæŸ','ææ–™ä¸Žèƒ½æºå­¦é™¢','2017','434@qq.com',NULL),('201904','å•æŸ','ææ–™ä¸Žèƒ½æºå­¦é™¢','2019','45434@qq.com',NULL),('201905','èµ–æŸ','ç”µå­ç§‘å­¦ä¸Žå·¥ç¨‹å­¦é™¢ï¼ˆç¤ºèŒƒæ€§å¾®ç”µå­å­¦é™¢ï¼‰','2017','jonor@gmail.com',NULL),('201906','çŽ‹æŸ','ææ–™ä¸Žèƒ½æºå­¦é™¢','2018','45345@qq.com',NULL);
/*!40000 ALTER TABLE `student_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach_record`
--

DROP TABLE IF EXISTS `teach_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teach_record` (
  `tch_rec_id` int NOT NULL AUTO_INCREMENT,
  `tchr_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`tch_rec_id`),
  KEY `tchr_id_idx` (`tchr_id`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id_tch_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tchr_id_tch_rec` FOREIGN KEY (`tchr_id`) REFERENCES `teacher_list` (`tchr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_record`
--

LOCK TABLES `teach_record` WRITE;
/*!40000 ALTER TABLE `teach_record` DISABLE KEYS */;
INSERT INTO `teach_record` VALUES (20,'201801','202001'),(21,'201802','202001'),(22,'201802','202002'),(23,'201804','202002'),(28,'201801','202003'),(29,'201802','202003'),(30,'201804','202003'),(31,'201804','202004'),(32,'201806','202004'),(33,'201802','202005'),(34,'201805','202005'),(35,'201801','202006'),(36,'201806','202006');
/*!40000 ALTER TABLE `teach_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_list`
--

DROP TABLE IF EXISTS `teacher_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_list` (
  `tchr_id` varchar(10) NOT NULL,
  `tchr_name` varchar(10) NOT NULL,
  `tchr_school` varchar(45) NOT NULL,
  `tchr_title` varchar(45) NOT NULL,
  `tchr_mail` varchar(45) NOT NULL,
  `tchr_avatar` blob,
  PRIMARY KEY (`tchr_id`),
  CONSTRAINT `fk_teacher_list_user_login_info1` FOREIGN KEY (`tchr_id`) REFERENCES `user_login_info` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_list`
--

LOCK TABLES `teacher_list` WRITE;
/*!40000 ALTER TABLE `teacher_list` DISABLE KEYS */;
INSERT INTO `teacher_list` VALUES ('201801','å°æ˜Ž','ä¿¡æ¯ä¸Žé€šä¿¡å·¥ç¨‹å­¦é™¢','æ•™æŽˆ','2018051401@suestc.edu.cn',NULL),('201802','å°ç»¿','ææ–™ä¸Žèƒ½æºå­¦é™¢','è®²å¸ˆ','123456789@qq.com',NULL),('201803','å°è“','ææ–™ä¸Žèƒ½æºå­¦é™¢','ç ”ç©¶å‘˜','957846@qq.com',NULL),('201804','å°ç´«','ææ–™ä¸Žèƒ½æºå­¦é™¢','è®²å¸ˆ','824346@qq.com',NULL),('201805','å°é»‘','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢','è®²å¸ˆ','445@qq.com',NULL),('201806','å°ç»¿','æœºæ¢°ä¸Žç”µæ°”å·¥ç¨‹å­¦é™¢','è®²å¸ˆ','junonor@gmail.com',NULL);
/*!40000 ALTER TABLE `teacher_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_record`
--

DROP TABLE IF EXISTS `time_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_record` (
  `time_rec_id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(10) NOT NULL,
  `class_time` int NOT NULL,
  PRIMARY KEY (`time_rec_id`),
  KEY `class_id_time_rec_idx` (`class_id`),
  CONSTRAINT `class_id_time_rec` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_record`
--

LOCK TABLES `time_record` WRITE;
/*!40000 ALTER TABLE `time_record` DISABLE KEYS */;
INSERT INTO `time_record` VALUES (21,'202001',0),(22,'202002',1),(24,'202004',3),(25,'202003',4),(26,'202005',6),(27,'202006',15);
/*!40000 ALTER TABLE `time_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_info`
--

DROP TABLE IF EXISTS `user_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_info` (
  `usr_id` varchar(10) NOT NULL,
  `usr_pwd` varchar(45) NOT NULL,
  `usr_type` int NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_info`
--

LOCK TABLES `user_login_info` WRITE;
/*!40000 ALTER TABLE `user_login_info` DISABLE KEYS */;
INSERT INTO `user_login_info` VALUES ('201801','201801',1),('201802','201802',1),('201803','201803',1),('201804','201804',1),('201805','201805',1),('201806','201806',1),('201901','201901',2),('201902','201902',2),('201903','201903',2),('201904','201904',2),('201905','201905',2),('201906','201906',2),('admin','admin',0);
/*!40000 ALTER TABLE `user_login_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16 20:15:54
