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
INSERT INTO `admin_list` VALUES ('admin','admin','admin','admin@uestc.edu.cn',_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0��\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0M\0\n\0\0!1AQa\"q��#2BR���3r\�$b%4CS����\�5cs�\'DTUt����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\Z\0\0\0\0\0\0\0\0\0\0!1�\�\0\0\0?\0\�舀���������������������������������\�\�\�9\�\�\�\�h0D�wS\�d����σs\�\�\� J[#I\����\�Ҳ}É\���)V\��6v\�\�f\�\�\\�p�n(�\�)|\�HAr\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"&U	*�\�=\\4\�.�VF\�̗�\�`+7JP\�O~�k�\�	?�\r��.�\�x��\�n\�\�i+.�h���;�\�؉A\�s(�\�E\�@�����N\�A�\Z\"r?\�q��約ӆB�ޑ�m\�\�ٖ�\��\�w��\�n\�Zz\�#c��Q\�!<�\�G�+5}�M�k�S1�\�=��/\�~a+�����\Z�N$�\�\����6t�\�-A�hnq9�MK�?e\�\�>j\�Q\�o�����:�^X�\�è]7gw雙�\�$q�\�;�\��\��($�M\\�jf��W\�\�\��+V�\�v���\�[\�<��v��>\�ꛝ�VW���=Z9K\"�8����%��AA)߿\�>2p+]\�|�\�	�\0Ȃ��\0�\�]=Upq\�O�>��\0\�k\�\���yâ�o�f�\�<\n	yE�z:�0�b\�+xp�\Z;\���\Z\�z�����\�	{������Q-%T\����B\�� �@��Kӻժ\�8\�m};~\�\�.\��u]�M���V��\�\�\�>�>NA\�\�y�k ���\�\�\�<e��\�/@<�UZ熌� � /�\�S\�\�f��\�ђ\�\0��\�5�\�Y4�e����\�0\"�\�?\�*;\�}\�\�Z�\�muk�NzA���PHmO�zV�\�<\�U4㳦�9�Eǵ�\�{���H\�\�\��\0_�\�\\\�c#�7d\�w�E(e�\�<\�<\����A䯿ݮ�.��\�Ts������\�\�VOG��KX��\�*Pz�6�8-΃\��LӀj\�\�]�\�\�?$���\�-[s\��y	^�\�.�oKPC�c\�S��N\�}Ꮰ�ǻ+W�z&��-ψ�\0\�\�B�KQ=-C&�GG+NZ\�T\�\�Օ�j��z̐�.�ZͿc��s*{\�,psY$�nB\�\��\�\"dQ�665�`\0��\�\�\�O~�׻\r5�?\� 7��\0\�z\��kluE\��\0\r$���X� 2\�3Z\�>}�\00�sޭ\��A\��&\�ٵK*⨒�~�B���3�\�ln��\��\�\�K\�g/�]4*�\�\��\�G\��\0OQ{\�2��\�zh7\�o\���Y�A��\�i��\�o�\0�7�/��J\�FY&���z�HeD�\�:.\�?�N\�`:�勝jGj�9\�\�.l{{��?�!�\�zU~\�\�O�Iu\�\�P\��\0\�\�8\�~!kXp\�G/=���D\�\�c^\���W8՛-�5d��?��\�>�O�PG�\'�\�!S�ki�ɦ�\�����\��d\����\n+�CM+�?ͮ\�}\�9k\r��h\�G]N\�\�gة�e��\�\"�ZiY,/s$ac\�pZ|B	\�\�\�\\�&\�oK����Q;A 6*�\�|�Ww�fOd�\�s2\�4\��興�������������������������������J��\�\�u�ERvQ�\�]	��;\���\�\�Ԗ\�5@\�˥[ �t\�<\�\�z�:\�|n��-�\Z\n{&`~�\���\�=Ot\�יּ\�>gxI\�`�chm�w\Z�R\�\�\�Q;\�m.qA�I$ys\�\\\�rI9$���I\�\��W\�5�T�e6}��\�u=	�����y\��M�o\���.\�GG\r;)顎X0\�F\�\0s\r-�Zv\�Y=ώ\�T0H��@�꺍-5%;a��8�o \�7\0/B ��L*�\" \"\"\" \"\"\" \"\"\" \"\"�D+���\�G%e;\'���<d�\�\�\�\�\r�\�X\�(���\�\�ǋ|B�k\��q\�H� �\0�pE\�6�v��KO`�JEɐT;�~G\�d7ki�%�NR\��]SK��4~�pL\�\�\�z{�OhelѶF89��\�Fݧݧ\�\�\�|�4Ow5/vL^\0�#���\�ױ�\�p8��DD@DDD@DDD@DDD@DDD@DDD@DDD@DDk�\�2�|�1\�\�\0w�	��[\�X4�F1\�\�\�F~mi�\�l[��V\�\�\�ڋ���l\�\�Tg��������g\�<�.{\�rI_)$t��\�qs�rK�I+x۽��kk�d-tV\�^=bs\�#�7Ġ�荽�\�Z\�\nV�T�?[R�\�yx�(tf��\�\�\�CN\�\�9���x\�\��\�Y�=��\�o��\�N\�i\�hh\rq\�|JȀ\0\n��������������������������>o`#�n\�\�\�j\'2Tұ��7��\�|\�\�\�Ddw�$�\�\\9�\�\�v��\�Cn�\r={�Ƒ\�2�w��~\r>Kѻ\�Pi\�چ\�NLGک�g\��p�X\�DtA=\� x�\�\\g7M�f��T�J@m,\�\���\�A\���{X\�\�8�d�z#�S\�G\�\�\�>\��\�\�Gմ�\�N\�ԏ�\����\�\�\�\�Y,�?Q\�N\�Y=Lg���4�. \\\��I�G�\'+\�o����\ZJx̒\��\�4w�\�ͷ�\Z�[\�\�O\�8�\rL�\�o���ue�\�\�m�\�\��6(\"h�u>%a���F\�z{|mw%D��\�~\�\�\0UN�\�]_Ko�uM]Dp@\�n�\�\0 �\"�\�5���;��\�)\�%o\�k���yP�(+�L�E��\�����M��*���:W\�\�\�\�{�w��\�\�5\�oKSN\�j�\0ykNZ���)\Zr�\" \"\"\" \"\"���\�-sAk�#�����\�U-�\��2S��h��\�\�*Nayn0\�(楨��C3\�DF)d�f\��\�\�\�D*v�q��}]+EҔ\0\��ѝ\����zm|\�%\rF]O1�\�|\�\���\�N^i\�rM�\�\���A9�\�UXm1�Ժv�\�L�YP̐x]Џ�Y�D@DDD@DDD@DDD@DDD@DDBpJ\�wZC�t�\�|m5�Κ>��\���\r?y7(\�h�c�H>��n&x?\�a��*3=\�\�.w7�J�\\k\�nUr\�U\�\�f�\�Ns�U\�@+�\�6��KW>\�+\Z\�hc%��g�\\���j�\��Yɬ`\�*X\�K\�\�\�{:ڧ�^\�գ�����r�誂�\�u�\�}ΏN�!\�oP\Z~ӝ�A���#\�\\\�d�O�n\���.\�\�D�\�\�sA��SE\�U����\�l楍��56\�a�S[��F\r��#\�J�D@By\"�\�\�A�\�U׉�i\�\�Y��y�(3\\\\�+����j\�t��\��y0v`{>RZ�x��d���}��\��\�Pe|\�wO\�i+豷�\�5�\�3yS���A�]\��=Ss�q.\�jFOvpK�w�3j˅g0\�i�9w��.=;̓\��\�\�$�Ԇ�q�\r�]\�\��|\�`>\���\�UD@DDD@DDD@DD\Zζ\�tڿMU[g\r\�8�~9�\����*	\�W��X[48xT\�~8J�[���\�ڒ�\��U!�\�\�(1��\�l�:�W.)+9\�\�y2_��0{���Zj�\�反�\�p<�S\'nuSun���/�7���6�T*������������������\�;�5ºuՕ2ᅅ\�q8�\n\��cU�u$\�ҽެ\��Oy1��oֹ\�ƕ��d���4��g\�	\�\���k�\�ւOv1\�tM�\�m\��\�7\�\�=\�ϲ>%g\�\rO�,1\\j\���c8�\\2cop�4aQ�\r\0�\����A�n\r\�\�45ڹ�\�\�	k=璅�8�G?$�I*P\��q�\�L��ǬԵ�x��T\\oR�Lz>\�.�����\�]A��\0y.ȵ���f\�\�\��0�<]\�m\����^�\��\�\��֪6�̮��7���a�k#\'�A:�)��t\�o챴�\�%B�\�\�S_o�\�++�\�z�PlȈ������\�u!�D^1J�\0\�lKY\��\�;\�?ݝ\�)<\�T��zh�\�Ը�n��.\�Ӫ���D`����:*�\������\�\�\�\�ȵ*�\�\�4�#A5�\�%�\�\�OE�C<s\�\�\"x|n\0�\�9TD@X\�\��h��\�F\�-9\�=\�d\�4_QYjt����Դ�)\�-\�GP~#{\�]\\\���\�<ء����ɲ}\��[���m6���\�CS\�\��]�.O+\�\�4N-��k�q\�	\�\��yW-Wo�u>�����K;9��\�EmH����������������_\�\Z��IiꫵO1p\�w�ǠY\�aF��զ\�~�\����Rp�FC�rk�\�{�ʢ��G>��C#\�|IYKe�\�\�u����ݡ\"��\�w��eb\�v\�\�Jj\ZvK<��̮��tpim)���&X�ˍ\�\�O\��\�?����g\��\�$n*..\�\\O\��?uh\�uUd07\�J��{\��Z[l�4Lhk`��\�t�\"\"���\�!?��\�z\��\�>J?RE\�\�E{\��+�zH��\�dgwd���\�l�\�\�\����pY \�JH\�\�\��B���(\�4@t\�o\�\����\��Q�\�\�\�02b\��|BX=_nm%v�#=�3����� ��\�E/6r�\�흴\�\�\��dk�ya\�IH�G[���q�9\�\�	Z?\�\�H;z\" \"\"\" ,6��\�4�\��t\��e|j��\�FC\�[�\�@��\��$�jô�Ɛ�\�Hw��o�n�߫\�^0b�\������\�\�Sj*�[���{�M�\0�	(:UkNB�`u��\������J�\�:�K<�:�>\�N\\\�\�\�R\�?\�( ِ�\�\�$�\�$��,vJ\�-\�o)�\���\�\0J&}�{���o�ΰ\�XO�ږ�<=��tDDA�\�\�ho�~�\�;AeD%���\���m$��\�Le�C���\�Gz���h6�Ź}]Q�\��\0��\�\�}im\�\�\��\�o\'\�W|>\��\�l��n{݈\�&�\��S�d �\" \"\"\" \"\"\" \"\"\" \"*8ᤠ\�j{\�>�\��wJ���\�\�wp��Kt�Mu�\�W\�8�Z�#��+��D\�CAm�F�˪&-����O�V���\� 4�z \����m\�mESt�W{\�#���ߺ\�Y\�Wf�����\ZO7K\�\�u���VB1\�H\�n�Tj\�W�n}\�<�X�(1wo�O_Y\�\�5-q�jj3���gܪG;�q=\��\�KA\�QD\�\�E�\�K#�˱xϞW��2�@\�\�;\�~􋷙l��?�9�\�\�u�\�V��i֘�R\�GB��/��h��W�#k��\�BJv|���\�u�hs]Ќz�!�\�\�\�\�q_HD2He�����m��v�\�\�\�O\'\�\'=�C{�I\��]\�{44��\�˝�u$���G\�<\�]p-y ��x獒D�\�=�\�#��}�ٍ\�6=7y��ц\�\��\�\�\�\'\��wF?�rAz\" \"\"�\��\�\\�����i֝ZۜQ�\�\�Ő9	\���;\�ך�=}��R<�Zy\�>Dw�\�\n^n��\�:fj\rC>��\�\��P涊{ml��Q�s\�\�\�\�X!߰^�/\�J[�á��<c\���\�QE\�\�\�Y/qث$?GU���\���\�T�k��Gz����\0�W�\��\0��z\�\�\�#�W��\��J+/�_�\��RѴ�\0�o����\0ңԇ2<���!��~��r���\0\�A\�QP�Q�\�*\��\�\�:�\�\��s����o}�׶β@\�))\�d�����E�eK�n��M�P\�Ǐ�\ns۪\�[o��a�F�!@�\�\�\�\�ܝsۋ\\���\�<���\�\r\��J���5P\�[��܉�\�[M\"ÿ�X=��Gv\�[E4�\�K\�8(ʳs�\rN\�\�^Nxg-�-�`��ۈ%#=�3\�� �\�$(���N�ܪ\��gcߒ����/�N�/�\�~��\��\�@�\�\�Р\�;St�ŵL�b9$\��aLv�P.�y)*��3\�$oi#�S[Gj56��\�!xq�!\�\0y�㓁��\�DD\Z�\�\�ᩴU\�\�\�\�n\�/\�o5\r&�\��:7=�!���)\��쨩��&]?�$�\�D~��+KG(\�\�\���\��W�[l\�r�f�by}0\'�i\�>k�(Y���v��z�^e\r\'�to~|�\�*����\�48`�J4o>ڋ%i�Z�w�N\�\�\�7\"\'x���+\�YIu<�\�1�Xdik\�\�B\�C3$�\�i�Щ-�{���dv;̀\\X\�E1\�ہ\�\�\�\�m%n���+SUk{�-c2\�<��\��\��t�kky��`\�%�^\0�(&0$���j��hp�\\wv��MI/\�VH�.\0bh�	G��]�Q_\�\�\�\�zZ���Tt\��\�#.#�\nO1�1�@+�B�\" \"\"\�5\�o�h�\�G\�\�1���s�\�Goۚ英%Ql-9<\�D��Rw\��\�5U89��?&�Q��T\�ڋ`�\�Ţ!\�H�c��4�DDD@XgF\��y�p\�}$��\�I��yy�[�XFC�x �\0)A#�\�ȩ-\�\�[\�\��!\'��Y#\�\�\�[�_P\�9	\\?2���uI\�\�w��H!\�ETD@DDD@DDD@DDGtUTw\�(!V\�S��_ޣy\����\�݁�E�|���{G�z�~\�]��6�t\�\�p8+P\�7�����\�!\"(\�\r�Ä�(&�X\rc��\��b�\� �3ٸ�׏�~k7�F�\�\�\�c����B!u�\�\�n3P\�\�c�p�\��c^�L^]k�J\�o� I\�Rwq\�5�\�~\�\�r���\�N_QqT\�no\���CEUU]=+\�\��\Z9\�(\'s\�朂2��c,0OOb���\�x\�cd>$�@DD\�\�(����xՏnB��\r~ˣl:~W\�l��O#�������UDD@DD\�\"��k�Z\�Py��t�\�\�)\�=x\ZW�PTDD@DDD@DDD@DC\�q�\Z� 5,W+�-�	8�B\�:P.7@���\���SLU\\�p\�kba\����(cr�T].3\�\�<�i�^��\�U\�+�%-.�y[@�*qY\�[l�R\�3\�S\�\�\��Q�`���]\'\�q\r/�N\\:\�\�G�~�G5�#\����T\�;}K\�<�?�\�\'r�\�ִ\�m+5�)�W43���Y\�J�Q\'mQ$����g+��7Q<E{�-��c�9�Þ�<Ԭ\�\�,����I\�,��wO�9�\��8tUA\�\�UD�}�\�\��>;�\�\�\�\�\���\�T[$�w�=�!eD.�F�1��\�C\��S�5-A��mC\�\�\�ǲ3�}\�nٝw�Ӱڪ��\0:Q3��rG\�\�\�u%\�7\�\�;x��\�\�Y<.\�\�B<\n�Z;wt棢�VVEA\\��\�\���	䃢>6���h-#���\�VJ:\�U\�\�\�b�\�%\��\�\�\�3���\�\�ÿE}C�a�\�\�a\�\�\�劭���5<\�\�\�\�=\�5E[�4�2h$d�9J_�歿\�\�T�ϕ�.\'\�Wy�x�\�Qi�[$��(I�9ꃸ��z*�\"*\n���vPP� �/��0\��VF	�\�p���{\\2#\�Ȉ������z*�\�\�U[����\�}��<��ˍ\�\�u��=��7I<\�hh\�\�SSQ\�^���+�3f����q\�X�/�ZwH\�$ֺ2\'.\�Gq8\0{�dt���\�6\n;]3@l,\��;\�\�g0������\�Y?�RTNFDQ����ʄZ��W�o�W*\��&��	\�\�\�Jp\���c�Z\�<A\\6�\��ʻ̓\�G#˻\'��\�\�P\nW��:}_� �\�\�E��\�4�1)���ቁ����h倰�SI\�i,v\��\��|��R;ĭ� �\" \"\"\" \"\"\" \"\"\" \"\"�\�3C��u���!\�\�;\�y��PB\�g�.\�:\�-=T���1T���\���-_��\�=<\�񫡦��tPG4N,{As��\�i+�K\�k\'�s\�Kav\0A\�6��s�k�l4o�\�\�\�#� NOS�/\\\�6��i�\��>�\�tM�j�0\�& ����;��M��\��:��̮�\�\�V\�j[�1\�%8#\�\n\�7j�P\�U\�00\�H$\�\0VCd+�\�Q��v>?\��U\�Uc/��{��\�S�ʝ�\���&��م\�m�\�4\���>\�\�\���0dޡ\��.|E��\0 \�W�{���\�JOcQ{A\�<�\�R\�d\�2퍸�d�\�o惢\"\"\" \"\"\" \"\"�W0��U\�\�8\'g-#�A\r5ޭ�_�]|�T\�#d\�dQ��1�\�av��\��{Mm��g\�i\�\�rxOvTz���Q\\[�b�O��\�ގ\�e\���\�\�B�U@����������\n\Z9�j$��Ǡ�A}EL4��i\�lq�q9\�8\0-\�z2\�9�\�\�R�p}Z>1�\\Gr�F�V\�f����Z\�1��e�r\�\�\��\�\\Zw�F\�f\�l�\�\'\0\�\���MW\r\\-�	Y$Nk\�\�A���Vߢ�󣫘\�|\�}L�e�yy��`���\�\�Z�\�҅ǳ�{LwV�Vu2��\�%\\��\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" aE\�H\ZO�\�\rǬS�O����uo�\�,�8q�c3\�N\n\�>�\�L\�\�Ɂ\���K�$1j�T�\�ڸ��\0� ���r�� �@Z\�\�S�փ�B�\�W�[2�]i�r\�SM���9�0��T�\�\n�\�@:\"O\�Լs\�\�c�@i�uT\�R��\"T��r�/�]�\�\�Jׁ\�;�\" \"\"\" \"\"\" +$�8W�;\� ����\�Wvc�/�꾎�\�\�\�\�>F&�\\\�^0�^\�����\0\�o���]����bZc\�\�ttUTP*ߊ\��]YH^ئ���\��uU\�ڨ\�T2\�\��٩\�s9^e���D\��\��d�#v\�f-��������q$>\�m�#���ɴ�N\�sm��v;��W ��r\�O�\Zb\�I,�\�>��\�%�#�e\�m�Q��\0c�ӷ��et|;�\�w\�T\�p\�棷�]�n��m\�v�)1\�Ì\Z\�\�\��캶\\�PW\�\�e�=��M9h*Zj\�\rڎ�g\�fk�D)\�A3jhi\�h I^>#(=\'�ҷ7Z�\�U�k�=�;O>}\�Kts����׬#\�Z��4��\�\��{��\�\�j\�;����s\�{�\�\�.,Wv�\�\\\0-��/	\�\�P�L\�*u���R\�]$�\0|��g\�\�+(�!����\��Ɓ\�\0\�J\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"/��\�\�9�5�\�Op�A�!n�X\�ю)�\�q\�\�k�h�gVkDi%\�q��l�n\�\��֗K�G�,����\�-����\�\�\�[�\�\�t�\�\�` �-\�0�V���Z�m#\�a\\�r9� �][v��ઐ̺���h�R\\)I]@�sZ�\�\�\�6��\�,\Zj�L�J\Zp\�\�\��\0K\�\��颒*h\�10��q�\��ET�Z�\�r��C=у\��\"�\���/�Y�����L\���=��ݷwj��{��\�$\"����l;\�y/�\�m]\�\�x�\�^��\�[\�$�\'�uUETD@DDD@DD\�p\�I4Y\�?h\���.\�z(�\�#T\�=���e��B=�84g4��M��Vs�\�i�\��\�Pv\�L�˅54jYZ��8S\"��\�4>����A�)\�\�\�ϵ#\�@\0 \��H鉄Oo\�5M1ӳ��W{����\�#�\�9Ē{\�\�\�Qp՗��U�e\�\�\��op{���ֺ��q3=���ɭ��Y\�\r\�)&\�\�L\�t�\�S��\�%\�\��\�-\�\�\�e5+`�1�^\�D@DDD@DDD@DDD@DDD@DDD@=>\�\rH�9�j\�j*� �\'�>�|@+�zG\�}m��w	%?�8 %\�\�\�s\�J=�\�ʹ\�v� *��8�b>\�=��\�/4Tc��?�v�\�j(@lPD\�\��=��eZ熷$�;�I\��d׫!2<W��\�\�N\'g<EMk\�}��\��SO\����\�p02&5�F\0�/�ex\�y/K2T�ؽ�\�\"\" \"\"\" \"\"\" �U|\�wr�\�\�ާ\�j#�^g9\�\��,\�\�\�5,2�\�=1\��U�e5|=��;�W\�x\ZH9\��)*\�=s��*!*��/���!cnZ�\�h�\�Wܩ�kz�\�3�A�{�a$\���(��\Z�G���\��\�\�z\���\�q��W\�\�j\�Ns\"x-����j\�qy\�$��Pe�\�ƒϨ\�5q�Xi��\���\�>kӫu�\�X]學J\�̞\�}�\�\�\0�ֽ޳ZkK\\�U\�+}�H�\��{,\�\r�\�n\�[�\�:Y\�vF��|�\�E\�\�\�tP��\�\�\�c\��/>�\�\�n��vP��\�\�mRG�\�\�<\�\�p�:*� \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\n}!\��gC,e <#�%I�t*,\������B�/\����w\���ul<�\�k4\�(m�lne�\�|�EL�y�q/#�/��F�J|�5ߙ�\�\"(\��_H\�X�\�\r_<*g\���o1�Udg-\n���|�B�\�\�R��x�U\�\�w1�B09,�\��DT\'�UE\�U��r@2\�,���\�_�\�\���\\W\�K-55�^ʮ�Ž�\�Ǝ��]M\�\r=\�&oF��\\\�S\�\'-\�\�A\�\�>\�\�\�\�%\�Z�W8��pq<\�3�~\�S]SY\'iU<�?�H\�J�s\�\0ʹ�s\�\rh$�@c+�\�\r���6+�����>\�!#\�%���\�t>\�\�5�\�8i\�\���\�Ni-h�R�Jh\�V����\�O��\�N\�!�\'�Y;=��\�n��\�N\�)\�k\Z?_5�\�A@<\�QP�Q�\�\Z�H��\rQ�z@\Z��\�\�\����gUi��\0�\�1c�s\�x\�\�p�q�mg�y\�b�a>\�q���`sNC� ����sN\�>L��\�j\rn�d�Ҳ1��a\�\�Pl�}\�ν\�hs_�\�-6:s\�~�\�,p<¡�Ttآ\�e\\#y\�^�\�\r\'\�1��^��\�^�V\�DD@DD\�x�7*;e+\�k�#���\�/[�ς��ը�U\�ڪ\�+\�e\'dY�<��\���\�45�9*j1���\���һ���m@���tu\'�a��%\�\�\�0<x�����Wj�dVƼԊ�8�\�I>X\�	�\n���\�N���\�4;�\�`�\�_l&9�\�\�c\�\�\��\n��\�\�!z�<��\�\�Cy�k\�\�䇒�\�\�ACG-ML���^��\�\0��Z�\�\�8�~��v�k*����\�u�({4��W\���ǈ����\�N��X\�i�\�\n\\YL\�yp�\�\�b4���\�Z��\�Nֿ\�&3���l7i)᝖\�\�0\�nld��魡\�:�\�s�\�?|�\�\�)Uk�R[mt�0D�<b6\�\�w���\���D\�%�I��K+���Ұ{�!t01ܮDD@DDD@DDD@DDD@DDD@DDD@DDD@DD�\�zk���\�R�\�猳�\�{�\�e��\�j,7��uKe���\�ˡ�.���\�\�\�F\�ed�4�7$�c��\�m�\�\"��ښ\��Td\n���;��Q\�\�\�언�\��{��#��r\r�ܦ_팲\�j\0��\�\��s3��u\�|\�T��\�<Ȃ\�r\"\" \"\"\" �\�me��=gRں�$``\��p�[\� \�=�\��n\�Kx�����\�+l�i�-��[m�ԮwS\0?5�Dª\"\" \"\"*d/-}Ɩ\�G%U\\\�\�\\��\0�\�4��7=\�\rkA$��(ϼ�o���Z\'p�Bq,�8\�\�\�Wn~�M|t����\�\�Y�p鼼�\���{#$�CĠ�\�<̍�/{\�\Zִs$�)a�{}���z���U0:g�1\�\���Cf��\��Z��N;S�M\�\�\�\�>k���\0*� \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" �\�A�I��\�-sOB\n����i[���q9֊�q1\�{\"~\��R��\�r�R]he����S\�\�\�\�Ȅ^��z\Z�\�)\�|sD\�&��!v\�{a��+V�s)\�]�GT91\�;���3q�n�O>k�����i\�\���g��\�� ��Hװ8ZFA�\�v�\�뮕���\�yvov\\\�\�\'�RSMj�N��\�]k�l�wڏ>\��3ȨӐ����������������\nǼ1��K\�SQ-;\���F\�\��\0��\�n�v��}�\�,��\�8\�\�>_<���\�z�w�\�����\�\�)�\�\�G]k���iT\�U1�����\�y���\�ߕ�\�:B\�.\r��Ҿ_\�!c�(0\�C%D͊8\�$� 5�$�\0��\�\�\�^�Y�<PѼro�w�\�v�j�\�BY�\�\\\�\�g7\"?&\��]H(\�p\�\0x+\��\"�\�c�\��=\�n6\�R\��:v(i+��\��Y!�\�vUB2A;���\�]%�NÂ9q\�W\�/\�=?^\�\�]d�Ӱ�a\�G�\�SS\�\�6��u5ґ�\�\�\�\�qQ\�Z\��\�$���r�\�vc\�#\��\0��\�\�9`��SF\�f\�\�7\�>d.�jԖ�\�B[uƞ���g\�\�\�\���X\�ǃ�\��_Jjʪx\�j%�Þcy�	\�UT>�o��5�e\�\�����n�wX�֪y�]�O\��E\�\���\�\�\\�|/i__��\�n�1kE\�?\�:�zY\��\��\0U�\�:\�\��Z\�8�\�{@A\�G:�Hۃ��%���\�d$�~\n�uuKa4�\�\�dy#\�T�\�/�����_Iz���\�t`�\0랋���QDD�}os\�taO!d��r\���E\\\��\�C�H\�[h�\�\�g���B�1)\Z\�惽\�\�PV\�ioZ�:aP�$T�\���^>\�\�m��Mt��H���\�6\�,5V�Ӷ�*K�抍́�\�({#�|\�\�\�r\�i��\01� \�@ª\�Rk7\\3M}�\�<��VN\Z\�Z��AS�Œ� �\"���)\�\�\�#(.EL�\\�\"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" +\\\�.�r յ\�\�P\��#n�\�\�\�1\���\\��\�\�̾\�x\�\�\�7��� 8Bwt\�Mel�\�u�I\�\'�x�Z\�N��\��\�k\"�h\\�7��\� \�\�\�1�)\�J\�C\�{q\�\����)\�-�\�8�\�}3��7�/��v\�\�-ty\�?�\�\��\�\�^\�d���c�\�\���s������\�\�19 \�~K\�K���#�zz\n&8}\�֔\�\r?x�pl��	\�\��\�\�k��\� ����R2#H8�Sz�\�i�o\�U\�E�g/hQ\�}o[\�\�\�Qj���h\�\�\�1��u\�`vn\�\�n\�Q08T;�~T�oE�\�k\�چ\�X\�������v\��\�>��a\��D=pOI7t�\�J&�̍�H\�~��\'��\�9F�O��<~�=wY�%�TIZ^jx\�\\�OB�\r�\�z�C[q�qT>6�I��GKQ��&V�\nz�	\�mA\��A��+\�Kr��x}-Tиw�\�.��:Bh�r\�\\\�\��L׵\��o\0��\�ӻ(6\�\�\�6\�O~�\r\�!\��Y�=�\�t�\�zZ�}e��乼q>G�1�\�\'\0Ԟ�o�l5l4�O�-C\�#C�\�\0��Ϳ\�.�\�\�֚Yc\�>Ȗ�\��^\�\����^\ZZ\�?\�\�#\'\�{\�N�X�����\�SN<d���c��\�{��1\�k�\�k�\�\�\0�$�:\�x��ک\�4r\�;��\�%�@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@ZV\�j:�/�k\�\�\�*�\�n�%\�[�\�\�4�\02IQ�y�چ\���`m���\�O��\�\�0��\�UT�y�\�|�$��C����7�WU�	��\�yOU�h-\'M���D\�pR�2\�\�[\�\�Gw\��%L�\�,�>.y+\�T���s�\�#S{�Fnkc\�\�湖\�Yt���6\�f���@\�g�I��\�\r\"{F���ϧ]�\�O�\�\��С%�\�Qw�\�PR\�_,\��8�4��\�GJ\�\�\��=�����*\�	��c���?�M \�<����$i� �\'\�ƻH[_�i���\�9f}Ki�\�\�j˝|��p\�x˽�\�u+�k}��\�_-�&��8\�����\\�����A-]D���\ri�\�\�\�+h\�j\�-���I\�wFF\�\�~H-����wM<��W�\�q$�V[K\�{����\�m��B}�\�\�`�q\�]E\�]\�\�#*����\�{��J@i\�-i\��\"�\�D\�x�\�;�\�\�\�ރP\��?eҬ���6\�\�G1,��X\�Ikp1\�TT\Z���\�_�n�:H\�V{��ry(I&x�z��\�sgin���D\��.q.�P��\�\\\�|PIG���Z>��G\�j�3=�\��]�G\�F\�z\���2N<\�*A�D@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@T\'\n�[\�z��GX&�U��\�\�|�\���{�,6\�b�\�©�X\�qFr�w�z����U�ouwZ\�qKP�\�p\�\�mF��X_\�SS���\�S8�Ow,0 \�\�ZB\�k\�\��\�T%�ե\�<�c	��}�\�Qf�R\�)�Y-<�\� ��%-�KC\�U�\�\�\�\�k{�G >\n<<�\�pB	\�a�\�|�\�ܡ-s*\"k�wx���;\�\�t/�l�\0�.�\����_�\�,���\�\�X\��\�\�u7�\�e{��f�A�A�\�\�Dw&��\0�F�\��)fށC���A�v�IÞ[�)�ވ*��q�@s\�A\'�\\\�[o\r�K�ZZi_q�g\�a�\0\�\r\�ܺ\�\n�tզN\�\����\����G\�9\�ys�K�\�O4.�ח�eP\�\�\�I��\�rc>+[�\'\���6�<�\09�Vݣ�\����㢦1\�qa\�R0{�J�\Z/i,\ZL��\�kk\���G&���\�Dl�\��c���ۨ\\2\ZG\�<{���\�Z\Zťi����x\�\�{�+akF2�Ak[�\\y��\" �A\�\�C\�B]s\0�\����mS�>*n;�5\r�ZO�W��^/�A�z:T��m\�\�)��%Gz��	V\�7�\�9\�\���\�\�CNFPU|g��D\�dw�\�\�U�O]ɬu�-�Ғ\�Y���|T�\�4S\�4\�ʎ�\�3MN�0��\�B:�I�*e��c�,n-sH\�@��)\�\�i�1�ᮑ\�\Z;ʒ�{q6�\0G\�)\�t71}�\�\�dq\�\�\�\\�ނOϿ�M�\�l5��\0`\�ꣾ���\�\�:\�Kdm\�\�\�2>yX~i��(:\�^M�rm\�\�\�\�8��3\�\�����\���մ5�OO��\\\�LV�v��V9ᭆ�\'�Ǡ\�?�\��5\�Iگ�\�3\"����#\�\rҵ��UZ�����;ᐧnc\\:8	�WC;$aØ\�\�\�\nn\��w\�%k�\�IS����00�8�y�\�<�Ux\��ms}�G]n\�\nw9������u�WºOD\\X�\��D�/J�et\�>G�^�\\I�+�m\�\�î4\��)n\�J&1ņq�\Z-�V\��\�\�[]Ƣ�\���\�\"d\�ސ-��*]AodLv\�0\����\�s\�W�Z�LJ\�6�\�R}\�\�\�~c�hnk�yc\�C��傂yR\�\�UMDl�H���z�(�\0�\�\�\�\�\��\�Ⱥ�\�\�\�\�\��ATD@DD����\��Kp\�r0�\��R�G�\0H\�Q\�-7F3#�G\�A\�6���\�ǳ\�ㆺn̜��)�΅@\�\n�\�\�)\�\�$> Ǒʛ�f�K�l4�*I\Z�\�\\\�mv9��2��������������������������������������r\�\�\�s\�\�ִd�q���\�\"\�:���qOx�AYup�\"�\�\�\�\�w,f\�\�[(x\�zbv\�SͲ\�c-�ɾ\'\�Gڪ��\�\�Q4�L�I#�$�\�]_<UU�\�OL\�h�\�f&CGp\���$r\��[6�з�aZ!�R�\�\�*0\��~*Fh��ӚlG=L\�^\�k��e�?\�oDM�\�\�UF����e�Z�ds\�fg��ܱ϶�\�Z��zz\�țO�<p7��_\�X�Ɔ�\0�\0*>&\�{C� �\� �$d\���\�Z\�\'Q��=Y\�ȸ�\�y)W��cJ\���\Zso�vI���I�-\�Ʊ\�[���Z\�B\��&s.�a\�mA\�Z\�jFz?\�Ui�\�\��m3�H=Xz�\�*9���}\�1��\�ZoQQ])$-�A#�\�\�A�e\�\�\\\�{.\r�\�J��\�[\����wtu\�\�V���\�&�p\�w�\��_r��u�P\�qM3˘\\9\��\0\�|sBr�T�ي3I��&\�\�q\�|�\�\�D\�\n	\�U�QҰ�y\�#c|\\y6�ըY4\�\�=Z���}\�s��*\�1\��5�\�F�\�y��CN#���e\�\�$�weIµ\r\�ӟ\�m_CA��\�\'�7��d�Od�\�\\`w����_\�Mm?w��e��S��:����8\��9�-vAI/G\�J+lU)d\�\�n\�#���\0�҈��_\Z���\�t�H\�\�h˞�`\�A�\\\�|m\�n\�\�hҽ��vp���y���Cj\�[0\�\�N8�>er}g�z���\�EA�\�e��s� \�\�]�cu���U[k�\���uE��G�a��>\\t�a�>\'�Ok\�k\�\�\�\�9�\�G\r�ݹhj!�\�\n�h�x!��\��\"㑲\�ױ�\�prA�DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDD@Bp��^;�\�C5ed����\�<�A[�\�I-]eC �&�>G�\0jܝ\�\�f[]�΂\�\�\�t|\�\�,6\�n]V��>��Ί\�\�0��\'E�\�\�\�S;!���=\�-h$�7\�u\�+�m\�\�WjW2\�y�ZKh\�\��|\�\�\0��\�6\�:+���~N���o��O�\��\�؀k\Z\Z\�9\00x\�6�;-�\Z\Z\nvCM\rkZ1�\0�\�\n����\�X\�X��4� �+\�g޽�m��\��\\DQT��\�\"��+��C�)\��\�\�-U�������A\�*:Wl��\�b���ZB\�S�\� y���z�(d�V\��pִd����\��NGL\�^���r�\�\�<5�^Ke\��I�t�p���Y\�G\�}A\��\���S5�H�\�5|$\�\��\��\�5\�\Z<��\r�\�\��@pFA\�B�Q\�!7\�-7��\�w\nX\�[M+�x|8]\�5M�Կ٭yn��NΖW���\��\0��v�iSx\�ͺ\�\�\�S@\�\'9�3\�\�~��è9A=���o ��Aʤ\�\�呬kFK�p��c|\�v;g�\�\�\�]q��\�9�\�{\�\�u6\�j=U)5��d]�\��	\r���Ni襎�O��\�q��\Z|ܸ&�\�\rE���T\�(\�yS\�\�c\�\�iчHxG2yc=V˦6�Pj��\�CF�C�u��\�ǽ�A\'�[&�\�ڋSL\�\�\�ɝ\�3\�\��<x�\�Z?b��Y\"��\�\��ȝ\��D�����\r<pD#��cF���A˴�\�X,�\Z��]p�nx�\0�\�y�\0�\�wkh�M�l�������\��&\�HLd���F#�ANZy��]\�h7[\�_O�/r��ǂ��\�\�\�\�\�|7wj\�o��P٣\�+�D\r\�?�y.&Zs\���\�\0��{\�\�m\�	L\Z~�!\�	঩q\�\�\�\�w��!Ȉ����������������������������\�[,��2�8��OpQ{w�2mK\\�5�G2\�N�=Ñ�\��>C�n\�߸?G\��\0g-�\0T\�Ω\�<\�\�\�\�*:d\�\�\\\�_�᧒�vE]$�pkZђJ�W�T�b�;�\�Kw�\���\�\��3�m���Q]\��\0�\�\�SF��6�,x�ۀA@�:v�=ʨ��D@DDDA�*���k\�{K\\\��\�\�\r<\�\�\�\�#\�x�RBAnz� S!\�\�j5}��\�\�-dǜb7q�\n�oj�F��\�]M�ST{ {�T\�#*��C9V�\�\�;d\�\�.�7:\�\��a\"6�\�~+�\�\�CKb���Fц���\�(\Z�\"uDA�\�ѽ�\�pÚ\�`�{���TT_\�p\�\��\�4\r\�0�� ~\�I�񨧎�\�+\�x\�s\\2A\���\�\�$\��F\�5�~�Q���SN��\�?5�\�\�\�;M\�:�h�\�H~���b\�\�<2\�O#%�\�i\�\\\�\��{4\�uW.I�[���e�\�0m\�\�w.٣���g��\nӷ[\�\�=-S\�\rd�si�\�s�\�\�\�_]\r��j���C\�\�\�:�u�Zң[j9+8i�\�t�\���5\�\�Eƺj��$�8�\�q\�J\�;=�\�ԗ�u���H\���\�\��M\�zR�Xj\Z{e0pk�f��oyS\Z�d�\�\�jk]8i\�`k|�O�F(\�Ț\�45��/�tDD@DDD@DDD@DDD@DDD@DDD@DDL��S\�\�	l�gF3\�d���j��:Yxg{j�Yh��	\�E|���\"\�^q�\�8~8A}m��\�\�\�\� ���c�8�Cnj4m\�\�)�\�-S�1H>\��%JVv����\\�:S\�\�*\�Gg�\�,�\�\\\�\��\�nK	�\�vrIC_Sl����WE</\�c�q��\�k(5����8\n�\�gS\�׎��\�;}V��\�K=M)�\�#����՜\�c\�>\�w	\�?�W�l����������jX�\�&�O\�\��kKKN]\�q��Y�A$��OZ*\�Ln\�\�\�e�!���|<\�I�۰2R\�&���\��|P{c\�\�*3\Z�_��`g\��@DDD@DDD@DDD@DDD@DDD@V=\�cK�@�I\��\���rE�ժ����\�\���}\�1�߸�ԃ��!\�\�W,n\�|��\0�C\Z\�$k	s�\r���s�\�J\�;%���rm�\�h���,p\�$�>\���\���\�i\�ީ�5ՠ>N\\\�\�rj\�\r�Q�\n\�D@DDD@DDD@DDD@DDD@DDD@DDD@^i�,����D=�<㟀�^�A\�\n��\�`�Y\��p9c�^�7�0D}��!�����=,<\�1��\�q�����H\�\�9�z 结`�\�\�6�8W\�\�2od���\�F2<o�\�\�=�	+��Z�Ig,�L^\���9�\�|T\�p\�F��ՠ\�^\�y��}k�x\�\�z�qA�즴����n�w\Z�?\�\�q<\�\�s�pw\'\�3\�\��cZGL��(1k���ܩ멞c��A\�\ngh�QO��\�5\��\0bFw�\��\�d�c�9\"\�R7\'\�.kG,<,�������������������������&�髕e9hi\��:9(C]YQp����C$�\�=\��DA�\�h=\�7t���Ѧ-��q�B\�v\�x�:�D\�D@DDD@DDD@DDD@DDD@DDD@DDD@DDD@DDDAE�k�]%\�D\�i\�\"��{ǈsFA�!c�1̮\�\�\�r�5�{a�4��g�~q��\"	\n:TDDA�\�');
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
INSERT INTO `class_info` VALUES ('202001','微积分',2,'A101',20,1,20,0),('202002','线性代数',6,'A102',100,1,20,0),('202003','离散数学',3,'A103',100,1,20,0),('202004','C语言',2,'A104',20,1,20,0),('202005','计算机网络',2,'A103',20,1,20,0),('202006','网络编程',2,'A105',20,1,20,0);
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
INSERT INTO `school_list` VALUES (181,'202001','信息与通信工程学院'),(182,'202001','电子科学与工程学院（示范性微电子学院）'),(183,'202001','材料与能源学院'),(184,'202001','机械与电气工程学院'),(185,'202001','光电科学与工程学院'),(186,'202001','自动化工程学院'),(187,'202001','资源与环境学院'),(188,'202001','计算机科学与工程学院（网络空间安全学院）'),(189,'202001','信息与软件工程学院（示范性软件学院）'),(190,'202001','航空航天学院'),(191,'202001','数学科学学院'),(192,'202001','物理学院'),(193,'202001','医学院'),(194,'202001','生命科学与技术学院'),(195,'202001','经济与管理学院'),(196,'202001','公共管理学院'),(197,'202001','外国语学院'),(198,'202001','马克思主义学院'),(199,'202001','格拉斯哥学院'),(200,'202001','体育部'),(201,'202002','信息与通信工程学院'),(202,'202002','电子科学与工程学院（示范性微电子学院）'),(203,'202002','材料与能源学院'),(204,'202002','机械与电气工程学院'),(205,'202002','光电科学与工程学院'),(206,'202002','自动化工程学院'),(207,'202002','资源与环境学院'),(208,'202002','计算机科学与工程学院（网络空间安全学院）'),(209,'202002','信息与软件工程学院（示范性软件学院）'),(210,'202002','航空航天学院'),(211,'202002','数学科学学院'),(212,'202002','物理学院'),(213,'202002','医学院'),(214,'202002','生命科学与技术学院'),(215,'202002','经济与管理学院'),(216,'202002','公共管理学院'),(217,'202002','外国语学院'),(218,'202002','马克思主义学院'),(219,'202002','格拉斯哥学院'),(220,'202002','体育部'),(221,'202003','信息与通信工程学院'),(222,'202003','电子科学与工程学院（示范性微电子学院）'),(223,'202003','材料与能源学院'),(224,'202003','机械与电气工程学院'),(225,'202003','光电科学与工程学院'),(226,'202003','自动化工程学院'),(227,'202003','资源与环境学院'),(228,'202003','计算机科学与工程学院（网络空间安全学院）'),(229,'202003','信息与软件工程学院（示范性软件学院）'),(230,'202003','航空航天学院'),(231,'202003','数学科学学院'),(232,'202003','物理学院'),(233,'202003','医学院'),(234,'202003','生命科学与技术学院'),(235,'202003','经济与管理学院'),(236,'202003','公共管理学院'),(237,'202003','外国语学院'),(238,'202003','马克思主义学院'),(239,'202003','格拉斯哥学院'),(240,'202003','体育部'),(241,'202004','信息与通信工程学院'),(242,'202004','电子科学与工程学院（示范性微电子学院）'),(243,'202004','材料与能源学院'),(244,'202004','机械与电气工程学院'),(245,'202004','光电科学与工程学院'),(246,'202004','自动化工程学院'),(247,'202004','资源与环境学院'),(248,'202004','计算机科学与工程学院（网络空间安全学院）'),(249,'202004','信息与软件工程学院（示范性软件学院）'),(250,'202004','航空航天学院'),(251,'202004','数学科学学院'),(252,'202004','物理学院'),(253,'202004','医学院'),(254,'202004','生命科学与技术学院'),(255,'202004','经济与管理学院'),(256,'202004','公共管理学院'),(257,'202004','外国语学院'),(258,'202004','马克思主义学院'),(259,'202004','格拉斯哥学院'),(260,'202004','体育部'),(261,'202005','信息与通信工程学院'),(262,'202005','电子科学与工程学院（示范性微电子学院）'),(263,'202005','材料与能源学院'),(264,'202005','机械与电气工程学院'),(265,'202005','光电科学与工程学院'),(266,'202005','自动化工程学院'),(267,'202005','资源与环境学院'),(268,'202005','计算机科学与工程学院（网络空间安全学院）'),(269,'202005','信息与软件工程学院（示范性软件学院）'),(270,'202005','航空航天学院'),(271,'202005','数学科学学院'),(272,'202005','物理学院'),(273,'202005','医学院'),(274,'202005','生命科学与技术学院'),(275,'202005','经济与管理学院'),(276,'202005','公共管理学院'),(277,'202005','外国语学院'),(278,'202005','马克思主义学院'),(279,'202005','格拉斯哥学院'),(280,'202005','体育部'),(281,'202006','信息与通信工程学院'),(282,'202006','电子科学与工程学院（示范性微电子学院）'),(283,'202006','材料与能源学院'),(284,'202006','机械与电气工程学院'),(285,'202006','光电科学与工程学院'),(286,'202006','自动化工程学院'),(287,'202006','资源与环境学院'),(288,'202006','计算机科学与工程学院（网络空间安全学院）'),(289,'202006','信息与软件工程学院（示范性软件学院）'),(290,'202006','航空航天学院'),(291,'202006','数学科学学院'),(292,'202006','物理学院'),(293,'202006','医学院'),(294,'202006','生命科学与技术学院'),(295,'202006','经济与管理学院'),(296,'202006','公共管理学院'),(297,'202006','外国语学院'),(298,'202006','马克思主义学院'),(299,'202006','格拉斯哥学院'),(300,'202006','体育部');
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
INSERT INTO `student_list` VALUES ('201901','黄某','信息与通信工程学院','2017','4546@qq.com',NULL),('201902','李某','电子科学与工程学院（示范性微电子学院）','2019','78637@qq.com',NULL),('201903','陈某','材料与能源学院','2017','434@qq.com',NULL),('201904','吕某','材料与能源学院','2019','45434@qq.com',NULL),('201905','赖某','电子科学与工程学院（示范性微电子学院）','2017','jonor@gmail.com',NULL),('201906','王某','材料与能源学院','2018','45345@qq.com',NULL);
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
INSERT INTO `teacher_list` VALUES ('201801','小明','信息与通信工程学院','教授','2018051401@suestc.edu.cn',NULL),('201802','小绿','材料与能源学院','讲师','123456789@qq.com',NULL),('201803','小蓝','材料与能源学院','研究员','957846@qq.com',NULL),('201804','小紫','材料与能源学院','讲师','824346@qq.com',NULL),('201805','小黑','机械与电气工程学院','讲师','445@qq.com',NULL),('201806','小绿','机械与电气工程学院','讲师','junonor@gmail.com',NULL);
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
