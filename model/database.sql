create Database casem3;
use casem3;
CREATE TABLE `rent`
(
    `rID`      int      NOT NULL,
    `checkIn`  datetime NOT NULL,
    `checkout` datetime DEFAULT NULL,
    `duration` int      DEFAULT NULL,
    `total`    int      DEFAULT NULL,
    PRIMARY KEY (`rID`, `checkIn`),
    CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `room` (`rID`)
);

INSERT INTO `rent`
VALUES (1, '2022-12-28 00:00:00', '2023-01-05 00:00:00', 48, 6000000),
       (2, '2022-12-20 00:00:00', '2022-12-21 00:00:00', 24, NULL),
       (3, '2022-12-01 00:00:00', '2022-12-02 00:00:00', 7, 600000),
       (1, '2022-12-03 00:00:00', '2022-12-04 00:00:00', NULL, NULL),
       (2, '2022-12-21 00:00:00', '2022-12-26 00:00:00', 28, 4900000),
       (3, '2022-12-26 00:00:00', '2022-12-27 00:00:00', 7, 700000),
       (3, '2022-12-02 00:00:00', NULL, NULL, NULL),
       (2, '2022-12-25 00:00:00', NULL, NULL, NULL);
CREATE TABLE `room`
(
    `rID`         int                            NOT NULL AUTO_INCREMENT,
    `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  DEFAULT NULL,
    `image`       varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `type`        enum ('single','double','vip') NOT NULL,
    `status`      enum ('still','sold')                                         DEFAULT 'still',
    `price`       int                            NOT NULL,
    `usable`      enum ('0','1')                 NOT NULL                       DEFAULT '1',
    PRIMARY KEY (`rID`)
);

INSERT INTO `room`
VALUES (1, 'biệt thự 5*', 'https://tuvannhadep.com.vn/uploads/files/hinh-anh-nha-dep-8.jpg', 'single', 'sold', 600000,
        '1'),
       (2, 'gom 1 giuong doi hoac 2 giuong don va 1 phong tam',
        'https://phunugioi.com/wp-content/uploads/2020/03/hinh-anh-nhung-ngoi-nha-dep-cho-khong-gian-song-ly-tuong.jpg',
        'vip', 'sold', 700000, '1'),
       (3, 'mo ta 1', 'https://angcovat.vn/imagesdata/TIN902049/1-thiet-ke-nha-dai-14m-mien-che.jpg', 'single', 'still',
        600000, '1');
CREATE TABLE `user`
(
    `name`      varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `birthday`  datetime                                                     NOT NULL,
    `email`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `password`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `telephone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `avatar`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    PRIMARY KEY (`email`)
);
INSERT INTO `user`
VALUES ('dai', '2001-10-26 00:00:00', 'hoa@gmail.com', 'abcd!@#$', '0951736248',
        'https://3.bp.blogspot.com/-Jol8kAcAh5E/WKMFGhnw7II/AAAAAAAAGYE/39Eim0xrRDMatRyvo7CiBWxVYlqDuo6xACEw/s1600/kich-thuoc-anh-3x4.jpg'),
       ('lam', '2002-12-25 00:00:00', 'hung@gmail.com', ' abc1234', '0963852741',
        'https://3.bp.blogspot.com/-Di9C8QOxZWA/WKMFGsEb0sI/AAAAAAAAGYI/925tyV0ICZITqIwmc92xdFw4DvOPcLVBACEw/s1600/anh-6x9.jpg'),
       ('nam', '2003-01-23 00:00:00', 'minh@gmail.com', '1234', '0123456789',
        'https://2.bp.blogspot.com/-OvzSvVKgZ-o/WKMFGVDf2bI/AAAAAAAAGYA/6nSIGSOOAmEpbfpfKsJ393SPT_FCHKPXgCEw/s1600/anh4x6.jpg');
