-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 08, 2023 lúc 01:41 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `medhealth`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `maHoaDon` int(11) NOT NULL,
  `hoadon` varchar(20) DEFAULT NULL,
  `maTA` int(11) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `gia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`maHoaDon`, `hoadon`, `maTA`, `soLuong`, `gia`) VALUES
(1, '20231118143337', 12, 1, 40),
(2, '20231118143337', 13, 1, 40),
(3, '20231118143436', 11, 1, 275),
(4, '20231118143436', 12, 1, 40),
(5, '20231118143436', 13, 1, 40),
(6, '20231118152440', 11, 1, 275),
(7, '20231118152440', 12, 1, 40),
(8, '20231120063630', 10, 1, 215),
(9, '20231120063630', 11, 1, 275),
(10, '20231120185313', 10, 1, 215),
(11, '20231120185313', 11, 1, 275),
(12, '20231120185313', 14, 1, 35),
(13, '20231120185313', 12, 1, 40),
(14, '20231120190132', 13, 1, 40),
(15, '20231122163951', 11, 1, 275),
(16, '20231122163951', 13, 1, 40),
(17, '20231126063752', 10, 1, 215),
(18, '20231126172448', 11, 1, 275),
(19, '20231130095806', 11, 1, 275),
(20, '20231130095806', 10, 1, 215),
(21, '20231130095806', 12, 1, 40),
(22, '20231130095806', 13, 1, 40),
(23, '20231202192153', 10, 3, 215),
(24, '20231203171139', 11, 3, 275),
(25, '20231203171139', 10, 1, 215),
(26, '20231203172456', 10, 3, 215),
(27, '20231206081533', 13, 2, 40),
(28, '20231206081533', 11, 1, 275),
(29, '20231206081533', 10, 1, 215),
(30, '20231206081841', 10, 3, 215),
(31, '20231206081841', 12, 1, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datlich`
--

CREATE TABLE `datlich` (
  `madl` int(11) NOT NULL,
  `ngay` date DEFAULT NULL,
  `gio` time DEFAULT NULL,
  `trangthai` int(11) DEFAULT NULL,
  `madv` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `ngaytao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `datlich`
--

INSERT INTO `datlich` (`madl`, `ngay`, `gio`, `trangthai`, `madv`, `id`, `ngaytao`) VALUES
(28, '2023-11-24', '17:39:00', 0, 3, 4, '2023-11-24 00:40:07'),
(29, '2023-11-29', '17:47:00', 1, 2, 4, '2023-11-26 23:47:19'),
(30, '2023-11-26', '16:55:00', 1, 4, 4, '2023-11-26 23:55:15'),
(31, '2023-11-30', '17:07:00', 0, 2, 4, '2023-11-27 00:07:35'),
(33, '2023-11-30', '15:57:00', 1, 3, 2, '2023-11-27 15:57:22'),
(34, '2023-11-30', '20:08:00', 1, 3, 4, '2023-11-30 20:14:13'),
(35, '2023-12-01', '20:17:00', 1, 1, 4, '2023-11-30 20:18:04'),
(36, '2023-12-04', '11:30:00', 1, 1, 4, '2023-12-03 01:41:11'),
(37, '2023-12-04', '11:30:00', 1, 1, 4, '2023-12-03 01:41:20'),
(38, '2023-12-04', '11:30:00', 1, 1, 4, '2023-12-03 01:41:33'),
(39, '2023-12-04', '11:30:00', 1, 1, 2, '2023-12-03 01:45:31'),
(40, '2023-12-04', '15:00:00', 1, 1, 2, '2023-12-03 23:12:44'),
(41, '2023-12-04', '15:30:00', 1, 4, 2, '2023-12-03 23:13:24'),
(42, '2023-12-06', '15:00:00', 1, 1, 2, '2023-12-03 23:26:09'),
(43, '2023-12-07', '14:37:00', 1, 4, 2, '2023-12-06 14:37:41'),
(44, '2023-12-07', '14:38:00', 0, 3, 2, '2023-12-06 14:38:52'),
(45, '2023-12-07', '16:44:00', 0, 2, 2, '2023-12-06 14:44:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dichvu`
--

CREATE TABLE `dichvu` (
  `madv` int(11) NOT NULL,
  `tendv` varchar(20) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `mota` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dichvu`
--

INSERT INTO `dichvu` (`madv`, `tendv`, `gia`, `mota`) VALUES
(1, 'Khám thú cưng', 150, 'Dịch vụ khám thú cưng cơ bản bao gồm:\r\n 1. Kiểm tra tổng quan sức khỏe.\r\n 2. Kiểm tra mắt, tai, răng miệng.\r\n 3. Kiểm tra da lông.\r\n 4. Kiểm tra tim và phổi.\r\n 5. Kiểm tra hệ tiêu hóa.\r\n 6. Tiêm phòng và tư vấn sức khỏe tổng thể.'),
(2, 'Tắm thú cưng', 300, 'Dịch vụ tắm thú cưng cơ bản:\r\n 1. Kiểm tra sức khỏe tổng quan.\r\n 2. Chuẩn bị nước ấm và sản phẩm tắm.\r\n 3. Tắm thú cưng và xả nước.\r\n 4. Sấy khô và chải lông.\r\n 5. Kiểm tra tai, mắt, và móng.\r\n 6. Tạo cảm giác thoải mái cho thú cưng.'),
(3, 'Cắt tỉa lông', 600, 'Dịch vụ cắt tỉa lông thú cưng cơ bản:\r\n 1. Kiểm tra sức khỏe tổng quan.\r\n 2. Tạo điểm cắt tỉa an toàn.\r\n 3. Cắt tỉa lông theo yêu cầu.\r\n 4. Chải và tạo kiểu lông.\r\n 5. Kiểm tra tai, mắt, và móng.\r\n 6. Tạo cảm giác thoải mái cho thú cưng.'),
(4, 'Hotel chó mèo', 500, 'Dịch vụ khách sạn chó mèo theo giờ:\r\n 1. Đón thú cưng tại khách sạn.\r\n 2. Cung cấp phòng thoải mái và sạch sẽ.\r\n 3. Cho ăn theo lịch trình.\r\n 4. Duyệt bộ lông hàng ngày.\r\n 5. Cho thú cưng ra ngoài và vận động.\r\n 6. Giám sát sức khỏe và tạo cảm giác thoải mái.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `maGioHang` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `maTA` int(11) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`maGioHang`, `id`, `maTA`, `soLuong`, `gia`, `ngayTao`) VALUES
(64, 4, 10, 1, 215, '2023-12-03 01:26:14'),
(65, 4, 11, 1, 275, '2023-12-03 01:26:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `maHoaDon` int(11) NOT NULL,
  `hoaDon` varchar(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`maHoaDon`, `hoaDon`, `id`, `ngayTao`, `status`) VALUES
(8, '20231118143337', 2, '2023-11-18 20:33:37', '3'),
(9, '20231118143436', 2, '2023-11-18 20:34:36', '2'),
(10, '20231118152440', 3, '2023-11-18 21:24:40', '3'),
(11, '20231120063436', 2, '2023-11-20 12:34:36', '2'),
(12, '20231120063630', 2, '2023-11-20 12:36:30', '3'),
(13, '20231120185313', 4, '2023-11-21 00:53:13', '2'),
(14, '20231120190132', 4, '2023-11-21 01:01:32', '2'),
(15, '20231122163951', 4, '2023-11-22 22:39:51', '2'),
(16, '20231126063752', 4, '2023-11-26 12:37:52', '3'),
(17, '20231126172448', 4, '2023-11-26 23:24:48', '3'),
(19, '20231202192153', 4, '2023-12-03 01:21:53', '2'),
(20, '20231203171139', 2, '2023-12-03 23:11:39', '2'),
(21, '20231203172456', 2, '2023-12-03 23:24:56', '2'),
(22, '20231206081533', 2, '2023-12-06 14:15:33', '2'),
(23, '20231206081841', 2, '2023-12-06 14:18:41', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaita`
--

CREATE TABLE `loaita` (
  `maLoaiTA` int(11) NOT NULL,
  `hinhLoai` varchar(255) DEFAULT NULL,
  `tenLoai` varchar(255) NOT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaita`
--

INSERT INTO `loaita` (`maLoaiTA`, `hinhLoai`, `tenLoai`, `status`) VALUES
(1, 'assets/dogfood.png', 'Thức ăn cho chó', 'on'),
(2, 'assets/catfood.png', 'Thức ăn cho mèo', 'on');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`) VALUES
(1, 'Chat'),
(2, 'Check');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thucan`
--

CREATE TABLE `thucan` (
  `maTA` int(11) NOT NULL,
  `tenTA` varchar(255) NOT NULL,
  `gia` decimal(10,2) NOT NULL,
  `danhGia` decimal(3,1) NOT NULL,
  `mieuTa` text NOT NULL,
  `soLuong` int(11) DEFAULT 1,
  `maloaiTA` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thucan`
--

INSERT INTO `thucan` (`maTA`, `tenTA`, `gia`, `danhGia`, `mieuTa`, `soLuong`, `maloaiTA`, `status`) VALUES
(10, 'ROYAL CANIN', 215.00, 5.0, 'Thức ăn cho chó con cỡ nhỏ ROYAL CANIN Mini Puppy dành cho các giống chó con dưới 10 tháng tuổi. Với công thức đặc chế riêng cho nhu cầu dinh dưỡng của chó con thuộc các giống cỡ nhỏ. Thức ăn cho chó con (các giống chó cỡ nhỏ) được nghiên cứu để cung cấp dinh dưỡng theo nhu cầu thực tế của chó con.\r\n\r\nDuy trì sức đề kháng cho chó con: chất chống oxy hóa CELT. Hỗ trợ hệ tiêu hóa hoạt động ổn định: L.I.P, đường FOS. Cung cấp dinh dưỡng toàn diện cho chó: chế biến theo công thức cung cấp năng lượng cao.\r\n\r\n', 50, 1, '1'),
(11, 'Hạt mềm vị bò ', 275.00, 5.0, '\r\nThức ăn cho chó hạt mềm vị thịt bò ORIGI-7 Beef được làm từ thịt bò tươi ngon, chỉ sử dụng nguồn nguyên liệu hữu cơ sạch, an toàn, cung cấp đầy đủ dinh dưỡng cho thú cưng phát triển khỏe mạnh.\r\n\r\nDành cho mọi giống chó thuộc mọi lứa tuổi\r\nĐược chế biến từ 100% thịt thật\r\n70% nguyên liệu là hữu cơ, được chọn lọc theo tiêu chuẩn nghiêm ngặt từ nuôi trồng đến sản xuất và chế biến\r\n7 FREE: KHÔNG bột thịt, chất bảo quản hóa học, màu nhân tạo, bột ngọt, hương nhân tạo, hormone tăng trưởng, GMO\r\nCông thức đặc biệt với sự kết hợp của nghệ, mật ong, dừa và các lợi khuẩn đường ruột\r\nNgăn ngừa dị ứng, nuôi dưỡng da khỏe và lông bóng mượt\r\nCải thiện hệ tiêu hóa, ngăn ngừa tiêu chảy\r\nTăng cường sức đề kháng, chống lão hóa\r\n', 50, 1, '1'),
(12, 'CIAO Scallop', 40.00, 4.5, 'Súp thưởng cho mèo CIAO Scallop vị ngao sò với thành phần chất lượng cao say nhuyễn. Có thể thưởng cho mèo ăn trực tiếp hoặc trộn cùng với thức ăn khác. Sản phẩm không chưa chất bảo quản. Mèo đặc biệt rất thích loại nước súp thưởng này.\r\n\r\n', 10, 2, '1'),
(13, 'CIAO Chicken', 40.00, 4.0, 'Súp thưởng cho mèo vị gà phi lê cá hồi CIAO Chicken Fillet & Salmon đã được say nhuyễn với hương vị thơm ngon. Soup thưởng CIAO Churu cũng giống như nước sốt pate cho mèo có thể cho ăn trực tiếp, hoặc trộn cùng với thức ăn để giúp kích thích vị giác của mèo.', 10, 2, '1'),
(14, 'Pate vị bò', 35.00, 4.0, 'Pate cho chó vị bò gà nướng sốt cà rốt JERHIGH Chicken Beef Grilled Chunks Carrot In Gravy với thiết kế bao bì hoàn toàn mới. Sản phẩm cung cấp đầy đủ protein và giá trị dinh dưỡng với lượng Omega 3 và kẽm được thêm vào để giúp giữ gìn sức khỏe của da và lông của chó. Đồng thời giúp giảm các dấu hiệu lão hóa.\r\n\r\n', 70, 1, 'on'),
(15, 'Xương Canxi', 50.00, 4.0, 'Xương Canxi cho chó VEGEBRAND Orgo High Calcium Cheese với 4 công hiệu – hiệu năng khi sử dụng.\r\nXương gặm sử dụng nguyên liệu tươi ngon, an toàn cho thú cưng.\r\nTiêu chuẩn sản xuất nghiệm ngặt, không có chất phụ gia.\r\nLàm sạch răng: với thiết kế hình xương có thể thúc đẩy khả năng nhai của thú cưng, hiệu quả trong việc làm sạch răng, loại bỏ cao răng, mảng bám, không còn tình trạng răng vàng, nướu chắc khỏe, nâng cao khả năng nhai.\r\nPhù hợp khẩu vị: với hương liệu từ phomat và sữa được phơi bằng gió tự nhiên, mùi vị đậm đà, độ dẻo cao, thích hợp làm đồ ăn để khen thưởng.\r\nGiúp xương chắc khỏe: với hàm lượng canxi cao giúp xương thú cưng luôn khỏe, răng chắc.\r\nBổ sung Canxi: tuyển chọn từ phomat tự nhiên, kết hợp với sữa, khiến cho hàm lượng Canxi cao, hiệu quả bổ sung canxi tốt.', 1, 1, 'on'),
(16, 'BBN Goat’s Milk', 320.00, 3.5, 'Sản phẩm sữa bột cho chó BBN Goat’s Milk New Zealand được chế biến sản xuất từ sữa dê thô đặc biệt tại New Zealand trên dây chuyền công nghệ cao.\r\nĐảm bảo giữ được hàm lượng dinh dưỡng cao nhất.\r\nSản phẩm này có thể thay thế cho sữa chó mẹ với nguồn dinh dưỡng giàu Protein, Canxi, không chứa chất gây dị ứng dành cho chó ở mọi lứa tuổi có thể sử dụng.\r\nSữa bột cho chó BBN Goat’s Milk New Zealand rất tốt cho dạ dày của thú cưng.\r\nKích thích tiêu hóa tránh táo bón.\r\nThành phần có chứa cả EFG có trong sữa chó mẹ giúp bảo vệ dạ dày của chó con một cách tốt nhất.', 60, 1, 'on'),
(17, 'ZENITH Puppy', 220.00, 3.5, '\r\nThức ăn cho chó con hạt mềm ZENITH Puppy Chicken Potato được chế biến từ thịt cừu tươi, thịt nạc gà rút xương, gạo lứt, yến mạch và dầu cá hồi. Với các thành phần tươi sạch, giàu dinh dưỡng, Zenith Puppy hạt mềm, cung cấp độ ẩm cao và lượng muối thấp, thơm ngon, dễ nhai, dễ tiêu hóa và tốt cho sức khỏe chó con.\r\n\r\nDành cho chó con dưới 1 tuổi\r\nKhông chứa ngũ cốc, không gây dị ứng\r\nĐược chế biến từ thịt cừu, bột gà, gạo lứt, yến mạch\r\nGiúp giảm bớt mùi phân và mùi cơ thể\r\nGiúp tăng cường sức đề kháng, phòng ngừa bệnh tật\r\nLàm đẹp da, đẹp lông\r\nCung cấp chất dinh dưỡng cần thiết cho sự tăng trưởng của chó con\r\nGiúp tăng cường sức khỏe đường ruột, tiêu hóa tốt, ngừa tiêu chảy', 70, 1, 'on');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tiem`
--

CREATE TABLE `tiem` (
  `maTiem` int(11) NOT NULL,
  `tenTiem` varchar(50) DEFAULT NULL,
  `ngayTiem` date DEFAULT NULL,
  `gioTiem` time DEFAULT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tiem`
--

INSERT INTO `tiem` (`maTiem`, `tenTiem`, `ngayTiem`, `gioTiem`, `userID`) VALUES
(1, 'Recombitek C4', '2022-01-01', '00:00:00', 1),
(2, 'Recombitek C6/CV', '2022-04-25', '00:00:00', 1),
(7, 'Mũi 1 - HCP', '2023-10-31', '00:00:00', 3),
(8, 'Mũi 1- FVRCP', '2023-11-15', '00:00:00', 1),
(9, 'Mũi 2 - HCP', '2024-02-05', '00:00:00', 3),
(63, 'Cavic CE', '2023-11-30', '15:24:00', 1),
(72, 'Vacin 123', '2023-12-07', '14:02:00', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `dateCreate` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `phone`, `password`, `dateCreate`, `role_id`) VALUES
(1, '1', '1', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-10-07 13:21:43', 1),
(2, 'Minh Trung', 'tmt@gmail.com', '123456789', '7f3ad6f0fd3ee69be5c19809880fd979 ', '2023-10-07 13:21:43', 2),
(3, 'Trí Vĩ', 'ptv@gmail.com', '0123456789', '6d9607f25ad989d26a44e53ffa78ca1f ', '2023-10-07 13:21:43', 2),
(4, 'Thuý Ngọc', 'nltn0611@gmail.com', '0346676849', '8d691bb7ca893a8cc3267ba5602d7cda ', '2023-10-07 13:21:43', 2),
(10, 'Nguyễn Văn A', 'vannguyen@gmail.com', '123456789', '9e37b7007f7998ef9d86c713d8c067f6', '2023-12-03 23:29:54', 2),
(11, 'Lê Trọng Nghĩa', 'ltn@gmail.com', '098765432', 'e855c8630d4a26fdec8940e0229acb4e', '2023-12-06 13:35:26', 2),
(12, 'Admin', 'admin@gmail.com', '1234567890', '0192023a7bbd73250516f069df18b500', '2023-12-06 15:09:57', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`maHoaDon`),
  ADD KEY `maTA` (`maTA`);

--
-- Chỉ mục cho bảng `datlich`
--
ALTER TABLE `datlich`
  ADD PRIMARY KEY (`madl`),
  ADD KEY `madv` (`madv`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`madv`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`maGioHang`),
  ADD KEY `id` (`id`),
  ADD KEY `maTA` (`maTA`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`maHoaDon`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `loaita`
--
ALTER TABLE `loaita`
  ADD PRIMARY KEY (`maLoaiTA`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `thucan`
--
ALTER TABLE `thucan`
  ADD PRIMARY KEY (`maTA`),
  ADD KEY `maloaiTA` (`maloaiTA`);

--
-- Chỉ mục cho bảng `tiem`
--
ALTER TABLE `tiem`
  ADD PRIMARY KEY (`maTiem`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `maHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `datlich`
--
ALTER TABLE `datlich`
  MODIFY `madl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `madv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `maGioHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `maHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `loaita`
--
ALTER TABLE `loaita`
  MODIFY `maLoaiTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `thucan`
--
ALTER TABLE `thucan`
  MODIFY `maTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tiem`
--
ALTER TABLE `tiem`
  MODIFY `maTiem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`maTA`) REFERENCES `thucan` (`maTA`);

--
-- Các ràng buộc cho bảng `datlich`
--
ALTER TABLE `datlich`
  ADD CONSTRAINT `datlich_ibfk_1` FOREIGN KEY (`madv`) REFERENCES `dichvu` (`madv`),
  ADD CONSTRAINT `datlich_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`maTA`) REFERENCES `thucan` (`maTA`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `thucan`
--
ALTER TABLE `thucan`
  ADD CONSTRAINT `thucan_ibfk_1` FOREIGN KEY (`maloaiTA`) REFERENCES `loaita` (`maLoaiTA`);

--
-- Các ràng buộc cho bảng `tiem`
--
ALTER TABLE `tiem`
  ADD CONSTRAINT `tiem_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
