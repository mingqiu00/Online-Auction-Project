-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2022 at 06:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned_bidder`
--

CREATE TABLE `banned_bidder` (
  `BID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banned_bidder`
--

INSERT INTO `banned_bidder` (`BID`, `ProID`) VALUES
(32, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bid_history`
--

CREATE TABLE `bid_history` (
  `BID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Time` datetime NOT NULL,
  `Price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_history`
--

INSERT INTO `bid_history` (`BID`, `ProID`, `Time`, `Price`) VALUES
(1, 4, '2022-01-09 11:20:14', '49000000'),
(1, 13, '2022-01-08 23:19:09', '3000000'),
(1, 14, '2022-01-07 23:28:25', '1510000'),
(1, 22, '2022-01-08 00:06:05', '1010000'),
(30, 14, '2022-01-07 23:28:25', '1500000'),
(30, 21, '2022-01-07 23:45:03', '310000'),
(30, 22, '2022-01-08 00:06:05', '1000000'),
(31, 13, '2022-01-08 23:19:09', '3000000');

-- --------------------------------------------------------

--
-- Table structure for table `bid_system`
--

CREATE TABLE `bid_system` (
  `BID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `MaxPrice` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_system`
--

INSERT INTO `bid_system` (`BID`, `ProID`, `MaxPrice`) VALUES
(1, 4, '50000000'),
(1, 13, '3000000'),
(1, 14, '2000000'),
(1, 22, '10000000'),
(30, 14, '1500000'),
(30, 21, '500000'),
(30, 22, '1000000'),
(31, 13, '3000000');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatID` int(11) NOT NULL,
  `CatName` varchar(50) NOT NULL,
  `CatParent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatID`, `CatName`, `CatParent`) VALUES
(1, 'Đồ điện tử', NULL),
(2, 'Thời trang', NULL),
(3, 'Mỹ phẩm', NULL),
(4, 'Nội thất', NULL),
(5, 'Trang sức', NULL),
(6, 'Laptop', 1),
(7, 'Điện thoại', 1),
(8, 'Quần áo Nam', 2),
(9, 'Quần áo Nữ', 2),
(10, 'Son', 3),
(11, 'Nước hoa', 3),
(12, 'Bàn', 4),
(13, 'Ghế', 4),
(14, 'Dây chuyền', 5),
(15, 'Vòng tay', 5);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `ID1` int(11) NOT NULL COMMENT 'Người đánh giá',
  `ID2` int(11) NOT NULL COMMENT 'Người bị đánh giá',
  `Date` datetime DEFAULT current_timestamp(),
  `Score` tinyint(1) NOT NULL,
  `Opinion` varchar(150) DEFAULT NULL,
  `ProID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`ID1`, `ID2`, `Date`, `Score`, `Opinion`, `ProID`) VALUES
(1, 30, '2021-12-31 10:57:19', 1, 'Người bán hàng quá đẹp trai và tốt bụng', 1),
(30, 1, '2021-12-31 10:59:35', 1, 'Mua hàng và trả tiền siêu nhanh. Good +1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fbuser`
--

CREATE TABLE `fbuser` (
  `facebookId` varchar(100) NOT NULL,
  `Role` smallint(6) NOT NULL DEFAULT 0,
  `Pending` tinyint(1) NOT NULL DEFAULT 0,
  `isBanned` tinyint(1) NOT NULL DEFAULT 0,
  `FullName` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fbuser`
--

INSERT INTO `fbuser` (`facebookId`, `Role`, `Pending`, `isBanned`, `FullName`, `Username`) VALUES
('2946274515703275', 0, 0, 0, 'Nguyễn Văn Tấn Phong', 'Phong');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProID` int(11) NOT NULL,
  `ProName` varchar(50) NOT NULL,
  `CatID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Winner` int(11) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `Start_price` decimal(10,0) NOT NULL,
  `Step_price` decimal(10,0) NOT NULL,
  `Buy_now` decimal(10,0) DEFAULT NULL,
  `UploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  `EndDate` datetime NOT NULL,
  `TinyDesc` varchar(150) DEFAULT NULL,
  `FullDesc` varchar(1000) NOT NULL,
  `AutoTime` tinyint(1) DEFAULT NULL,
  `AllowAll` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProID`, `ProName`, `CatID`, `SID`, `Winner`, `Status`, `Start_price`, `Step_price`, `Buy_now`, `UploadDate`, `EndDate`, `TinyDesc`, `FullDesc`, `AutoTime`, `AllowAll`) VALUES
(1, 'Freshwater Cultured Pearl', 9, 30, NULL, 1, '1500000', '150000', '5500000', '2021-12-02 22:08:16', '2021-12-04 09:32:16', 'Freshwater Cultured Pearl, Citrine, Peridot & Amethyst Bracelet, 7.5\"', '<UL>\r\n    <LI>Metal stamp: 14k </LI>\r\n    <LI>Metal: yellow-ld</LI>\r\n    <LI>Material Type: amethyst, citrine, ld, pearl, peridot</LI>\r\n    <LI>Gem Type: citrine, peridot, amethyst</LI>\r\n    <LI>Length: 7.5 inches</LI>\r\n    <LI>Clasp Type: filigree-box</LI>\r\n    <LI>Total metal weight: 0.6 Grams</LI>\r\n</UL>\r\n<STRONG>Pearl Information</STRONG><BR>\r\n<UL>\r\n    <LI>Pearl type: freshwater-cultured</LI>\r\n</UL>\r\n<STRONG>Packaging Information</STRONG><BR>\r\n<UL>\r\n    <LI>Package: Regal Blue Sueded-Cloth Pouch</LI>\r\n</UL>', 1, 0),
(3, 'Torrini KC241', 15, 30, NULL, 0, '160000000', '1000000', NULL, '2021-12-02 08:41:03', '2022-12-02 21:08:00', 'Nhẫn kim cương - vẻ đẹp kiêu sa', '<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>\r\n</UL>\r\n', 1, 0),
(4, 'Torrini KC242', 15, 30, NULL, 0, '42000000', '1000000', NULL, '2021-12-02 08:41:03', '2022-03-08 00:23:16', 'tinh xảo và sang trọng', '<P>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.<BR>\r\nVới sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nam</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: Vàng tây 24K, nguyên liệu và công nghệ Italy...</LI>\r\n</UL>\r\n', 1, 1),
(5, 'Nokia 7610', 7, 30, NULL, 0, '2900000', '500000', '5900000', '2021-12-02 08:32:16', '2023-09-06 14:29:16', 'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.', '<UL>\r\n    <LI>Máy ảnh có độ phân giải 1 megapixel</LI>\r\n    <LI>Màn hình 65.536 màu, rộng 2,1 inch, 176 X 208 pixel với đồ họa sắc nét, độ phân giải cao</LI>\r\n    <LI>Quay phim video lên đến 10 phút với hình ảnh sắc nét hơn</LI>\r\n    <LI>Kinh nghiệm đa phương tiện được tăng cường</LI>\r\n    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>\r\n    <LI>Nâng cấp cho những đoạn phim cá nhân của bạn bằng các tính năng chỉnh sửa tự động thông minh</LI>\r\n    <LI>In ảnh chất lượng cao từ nhà, văn phòng, kios và qua mạng</LI>\r\n    <LI>Dễ dàng kết nối vớI máy PC để lưu trữ và chia sẻ (bằng cáp USB, PopPort, công nghệ Bluetooth)</LI>\r\n    <LI>48 nhạc chuông đa âm sắc, True tones. Mạng GSM 900 / GSM 1800 / GSM 1900</LI>\r\n    <LI>Kích thước 109 x 53 x 19 mm, 93 cc</LI>\r\n    <LI>Trọng lượng 118 g</LI>\r\n    <LI>Hiển thị: Loại TFT, 65.536 màu</LI>\r\n    <LI>Kích cở: 176 x 208 pixels </LI>\r\n</UL>', 1, 0),
(7, 'Simen AP75', 7, 30, NULL, 0, '2800000', '1000000', '8880000', '2021-12-02 08:32:16', '2024-08-07 09:32:16', 'Thiết kế tinh xảo, hiện đại', '<UL>\r\n    <LI>Hình ảnh hoàn hảo, rõ nét ở mọi góc màn hình</LI>\r\n    <LI>Giảm thiểu sự phản chiếu ánh sáng</LI>\r\n    <LI>Menu hiển thị tiếng Việt</LI>\r\n    <LI>Hệ thống hình ảnh thông minh</LI>\r\n    <LI>Âm thanh Hifi Stereo mạnh mẽ</LI>\r\n    <LI>Hệ thống âm lượng thông minh</LI>\r\n    <LI>Bộ nhớ 100 chương trình</LI>\r\n    <LI>Chọn kênh ưa thích</LI>\r\n    <LI>Các kiểu sắp đặt sẵn hình ảnh / âm thanh</LI>\r\n    <LI>Kích thước (rộng x cao x dày): 497 x 458 x 487mm</LI>\r\n    <LI>Trọng lượng: 25kg</LI>\r\n    <LI>Màu: vàng, xanh, bạc </LI>\r\n</UL>\r\n', 1, 0),
(9, 'Bông tai nạm hạt rubby', 15, 30, NULL, 0, '2400000', '100000', NULL, '2021-12-02 08:42:00', '2025-08-11 09:32:16', 'Trẻ trung và quý phái', '<UL>\r\n    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>\r\n    <LI>Đóng nhãn hiệu: Torrini</LI>\r\n    <LI>Nguồn gốc, xuất xứ: Italy</LI>\r\n    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>\r\n    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>\r\n    <LI>Chất lượng/chứng chỉ: od</LI>\r\n</UL>\r\n', 1, 1),
(10, 'Đầm dạ hội ánh kim', 9, 30, NULL, 0, '2800000', '100000', NULL, '2021-12-02 08:42:00', '2022-08-11 22:32:16', 'Đủ màu sắc - kiểu dáng', '<UL>\r\n    <LI>Màu sắc: Khuynh hướng ánh kim có thể thể hiện trên vàng, bạc, đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>\r\n    <LI>Một số biến tấu mang tính vui nhộn là vàng chanh, màu hoa vân anh và ngọc lam; trong đó hoàng kim và nhũ bạc khá phổ biến.</LI>\r\n    <LI>Phong cách: Diềm đăng ten, rủ xuống theo chiều thẳng đứng, nhiều lớp, cổ chẻ sâu, eo chít cao tới ngực... được biến tấu tùy theo mỗi nhà thiết kế.</LI>\r\n</UL>\r\n09-01-2022<br><ul>\r\n<li>Đồ mới đẹp lắm, mọi người mua đi</li>\r\n</ul>', 1, 0),
(13, 'Đầm dạ hội Xinh Xinh', 9, 2, NULL, 0, '2600000', '100000', NULL, '2021-12-02 08:42:28', '2022-05-29 19:25:16', 'Đơn giản nhưng quý phái', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 1, 1),
(14, 'Đầm dạ hội NEM', 9, 2, NULL, 0, '1200000', '100000', '2200000', '2021-12-02 08:32:16', '2022-09-09 18:32:22', 'Táo bạo và quyến rũ', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 0, 1),
(15, 'Dây chuyền đá quý', 14, 2, NULL, 0, '1925000', '100000', NULL, '2021-12-02 08:42:42', '2022-06-09 10:28:16', 'Kết hợp vàng trắng và đá quý', '<UL>\r\n    <LI>Kiểu sản phẩm: Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>\r\n</UL>\r\n', 0, 1),
(16, 'Nokia N72', 7, 2, NULL, 0, '3200000', '1000000', '6400000', '2021-12-02 08:32:16', '2022-09-27 06:32:16', 'Sành điệu cùng N72', '<UL>\r\n    <LI>Camera mega pixel : 2 mega pixel</LI>\r\n    <LI>Bộ nhớ trong : 16 - 31 mb</LI>\r\n    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>\r\n    <LI>Hỗ trợ: Bluetooth, thẻ nhớ nài, nhạc MP3 &lt;br/&gt;</LI>\r\n    <LI>Trọng lượng (g) : 124g</LI>\r\n    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>\r\n    <LI>Ngôn ngữ : Có tiếng việt</LI>\r\n    <LI>Hệ điều hành: Symbian OS 8.1</LI>\r\n</UL>\r\n', 0, 0),
(17, 'Mặt dây chuyền Ruby', 14, 2, NULL, 0, '1820000', '1000000', '5000000', '2021-12-02 08:32:16', '2022-06-19 09:42:16', 'Toả sáng cùng Ruby', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>\r\n</UL>\r\n', 0, 0),
(18, '1/2 Carat Pink Sapphire Silver', 15, 2, NULL, 0, '3400000', '100000', NULL, '2021-12-02 08:42:57', '2022-11-24 09:32:25', 'Created Pink Sapphire', '<UL>\r\n    <LI>Brand Name: Ice.com</LI>\r\n    <LI>Material Type: sterling-silver, created-sapphire, diamond</LI>\r\n    <LI>Gem Type: created-sapphire, Diamond</LI>\r\n    <LI>Minimum total gem weight: 14.47 carats</LI>\r\n    <LI>Total metal weight: 15 Grams</LI>\r\n    <LI>Number of stones: 28</LI>\r\n    <LI>Created-sapphire Information</LI>\r\n    <LI>Minimum color: Not Available</LI>\r\n</UL>\r\n', 1, 0),
(19, 'Netaya', 14, 2, NULL, 1, '1820000', '100000', NULL, '2021-12-02 08:42:57', '2022-01-08 04:17:00', 'Dây chuyền vàng trắng', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng tây 18K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1 Chỉ</LI>\r\n</UL>\r\n', 1, 1),
(21, 'G3.370A', 8, 1, NULL, 0, '300000', '100000', '1300000', '2021-12-02 08:32:16', '2026-10-07 14:37:19', 'Đen bóng, sang trọng', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 0, 1),
(22, 'Giày nữ GN1', 9, 1, NULL, 0, '290000', '100000', NULL, '2021-12-02 08:43:12', '2022-07-08 00:10:11', 'Kiểu dáng thanh thoát', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 0, 1),
(23, 'Motorola W377', 7, 1, NULL, 0, '2400000', '1000000', NULL, '2021-12-02 08:43:44', '2023-09-14 20:28:11', 'Nữ tính - trẻ trung', '<UL>\r\n    <LI>General: 2G Network, GSM 900 / 1800 / 1900</LI>\r\n    <LI>Size:&nbsp; 99 x 45 x 18.6 mm, 73 cc</LI>\r\n    <LI>Weight: 95 g</LI>\r\n    <LI>Display: type TFT, 65K colors</LI>\r\n    <LI>Size: 128 x 160 pixels, 28 x 35 mm</LI>\r\n</UL>\r\n', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('Ng3AkyApiPPZJ9h07L7kpeNM3c14xvud', 1641828607, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"cart\":[],\"flash\":{},\"authUser\":{\"ID\":33,\"Username\":\"phongdzvl\",\"FullName\":\"Nguyễn Văn Tấn Phong\",\"DOB\":\"2022-01-04T17:00:00.000Z\",\"Email\":\"19127646@student.hcmus.edu.vn\",\"Role\":0,\"Pending\":0,\"Verified\":1,\"isBanned\":0,\"ExpiredDate\":null},\"passport\":{\"user\":{\"id\":\"2946274515703275\",\"name\":{\"familyName\":\"Nguyễn\",\"givenName\":\"Phong\",\"middleName\":\"Văn Tấn\"},\"emails\":[{\"value\":\"hackkerguy@yahoo.com\"}],\"provider\":\"facebook\",\"_raw\":\"{\\\"id\\\":\\\"2946274515703275\\\",\\\"email\\\":\\\"hackkerguy\\\\u0040yahoo.com\\\",\\\"last_name\\\":\\\"Nguy\\\\u1ec5n\\\",\\\"first_name\\\":\\\"Phong\\\",\\\"middle_name\\\":\\\"V\\\\u0103n T\\\\u1ea5n\\\",\\\"birthday\\\":\\\"04\\\\/20\\\\/2001\\\"}\",\"_json\":{\"id\":\"2946274515703275\",\"email\":\"hackkerguy@yahoo.com\",\"last_name\":\"Nguyễn\",\"first_name\":\"Phong\",\"middle_name\":\"Văn Tấn\",\"birthday\":\"04/20/2001\"}}}}'),
('jAfpRQFm93_QLtAspPZ2xBDgqy0aj96_', 1641835569, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"cart\":[],\"flash\":{},\"authUser\":{\"ID\":30,\"Username\":\"phong123\",\"FullName\":\"Phong Nguyen\",\"DOB\":\"2000-12-07T17:00:00.000Z\",\"Email\":\"hackkerguy11@gmail.com\",\"Role\":1,\"Pending\":0,\"Verified\":1,\"isBanned\":0,\"ExpiredDate\":null}}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Role` int(11) NOT NULL DEFAULT 0,
  `Pending` tinyint(1) NOT NULL DEFAULT 0,
  `Verified` tinyint(1) NOT NULL DEFAULT 0,
  `isBanned` tinyint(1) NOT NULL DEFAULT 0,
  `ExpiredDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Username`, `FullName`, `Password`, `DOB`, `Email`, `Role`, `Pending`, `Verified`, `isBanned`, `ExpiredDate`) VALUES
(1, 'admin', 'Nguyễn Văn Tấn Phong', '$2a$10$D6QfslwNdlVonTrxPci7q.hIHAp9zEMfkbLJWigIGU1VHxV5L3pJ.', '2001-04-19', 'nvtphong19@clc.fitus.edu.vn', 2, 0, 1, 0, NULL),
(2, 'nvtPhong', 'Nguyễn Văn Tấn Phong', '$2a$10$D6QfslwNdlVonTrxPci7q.hIHAp9zEMfkbLJWigIGU1VHxV5L3pJ.', '2001-12-05', 'nvtphong19@clc.fitus.edu.vn', 1, 0, 0, 0, NULL),
(3, 'tgHy', 'Trần Gia Hy', '123', '2000-12-15', 'tghy@gmail.com', 0, 0, 0, 0, NULL),
(5, 'tthieu', 'Trần Trung Hiếu', '123', '2001-12-07', 'tthieu19@clc.fitus.edu.vn', 0, 0, 1, 0, NULL),
(16, 'phongdzso1', 'phong', '$2a$10$Q/6.m.OdID6cf7e0pxtU0OhLoCtTaYNXG0jXZxXJRzT8zYQLGHvfG', '2021-12-09', 'hackkerguy11@gmail.com', 1, 0, 1, 1, NULL),
(29, 'Phongdz', 'asfsad', '$2a$10$9vo6pAPk8QLUL6CW8Ti3VuLaex3qwyvGlj.zJUj3jN6xCDGJ3Db/S', '2021-12-03', 'asdfasd@hi.com', 0, 0, 0, 0, NULL),
(30, 'phong123', 'Phong Nguyen', '$2a$10$Rq35FP9LMya94T8B4NunOeH00P2jdCnY/LO0KyRJxJyKi4majkZ5m', '2000-12-08', 'hackkerguy11@gmail.com', 1, 0, 1, 0, NULL),
(31, 'Phong', 'Nguyễn Văn Tấn Phong', '', '2001-04-20', 'hackkerguy@yahoo.com', 1, 0, 1, 0, NULL),
(32, 'ntmthu', 'Nguyễn Thị Minh Thu', '$2a$10$TJVfzJ1ZQLHhnuHa3ltblugmFsfyUNIOF6pWc4S.JhZG/VMeN3RQ6', '2021-12-28', '19127568@student.hcmus.edu.vn', 0, 0, 1, 0, NULL),
(33, 'phongdzvl', 'Nguyễn Văn Tấn Phong', '$2a$10$tmaLpnSatF1LPXMpMMtvj.54pIXKZOO9AHlPIWawwc.YFnmkEeT1a', '2022-01-05', '19127646@student.hcmus.edu.vn', 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(11) NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL,
  `token` varchar(250) CHARACTER SET utf8 NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banned_bidder`
--
ALTER TABLE `banned_bidder`
  ADD PRIMARY KEY (`BID`,`ProID`);

--
-- Indexes for table `bid_history`
--
ALTER TABLE `bid_history`
  ADD PRIMARY KEY (`BID`,`ProID`),
  ADD KEY `ProID` (`ProID`);

--
-- Indexes for table `bid_system`
--
ALTER TABLE `bid_system`
  ADD PRIMARY KEY (`BID`,`ProID`),
  ADD KEY `ProID` (`ProID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatID`),
  ADD UNIQUE KEY `CatName` (`CatName`);
ALTER TABLE `category` ADD FULLTEXT KEY `CatName_2` (`CatName`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID1`,`ID2`,`ProID`);

--
-- Indexes for table `fbuser`
--
ALTER TABLE `fbuser`
  ADD PRIMARY KEY (`facebookId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProID`);
ALTER TABLE `product` ADD FULLTEXT KEY `FTX_product` (`ProName`,`TinyDesc`,`FullDesc`);
ALTER TABLE `product` ADD FULLTEXT KEY `ProName` (`ProName`,`TinyDesc`,`FullDesc`);
ALTER TABLE `product` ADD FULLTEXT KEY `ProName_2` (`ProName`);
ALTER TABLE `product` ADD FULLTEXT KEY `ProName_3` (`ProName`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banned_bidder`
--
ALTER TABLE `banned_bidder`
  ADD CONSTRAINT `fk_banned_bidder_BID` FOREIGN KEY (`BID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_banned_bidder_ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`ProID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bid_history`
--
ALTER TABLE `bid_history`
  ADD CONSTRAINT `fk_bid_history_BID` FOREIGN KEY (`BID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bid_history_ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`ProID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bid_system`
--
ALTER TABLE `bid_system`
  ADD CONSTRAINT `fk_bid_system_BID` FOREIGN KEY (`BID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bid_system_ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`ProID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_CatParent` FOREIGN KEY (`CatParent`) REFERENCES `category` (`CatID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_ID1` FOREIGN KEY (`ID1`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_ID2` FOREIGN KEY (`ID2`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_ProID` FOREIGN KEY (`ProID`) REFERENCES `product` (`ProID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_CatID` FOREIGN KEY (`CatID`) REFERENCES `category` (`CatID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_SID` FOREIGN KEY (`SID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_Winner` FOREIGN KEY (`Winner`) REFERENCES `user` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `Expire_verifications` ON SCHEDULE EVERY 1 HOUR STARTS '2022-01-09 21:45:42' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Clears out verification table every hour.' DO DELETE FROM verifications WHERE UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(created_at) > 60$$

CREATE DEFINER=`root`@`localhost` EVENT `Expire_Seller` ON SCHEDULE EVERY 1 HOUR STARTS '2022-01-10 22:23:41' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE user
SET Role = 3
WHERE ExpiredDate IS NOT NULL
AND (UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(ExpiredDate)) > 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
