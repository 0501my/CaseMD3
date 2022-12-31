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
       (1, '2022-12-20 00:00:00', '2022-12-21 00:00:00', 24, NULL),
       (1, '2022-12-01 00:00:00', '2022-12-02 00:00:00', 7, 600000),
       (1, '2022-12-03 00:00:00', '2022-12-04 00:00:00', NULL, NULL),
       (2, '2022-12-21 00:00:00', '2022-12-26 00:00:00', 28, 4900000),
       (2, '2022-12-26 00:00:00', '2022-12-27 00:00:00', 7, 700000),
       (2, '2022-12-01 00:00:00', NULL, NULL, NULL),
       (5, '2022-12-25 00:00:00', NULL, NULL, NULL);
CREATE TABLE `room`
(
    `rID`         int                            NOT NULL AUTO_INCREMENT,
    `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  DEFAULT NULL,
    `image`       varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `type`        enum ('single','double','vip') NOT NULL,
    `status`      enum ('available','rented')                                   DEFAULT 'available',
    `price`       int                            NOT NULL,
    `usable`      enum ('0','1')                 NOT NULL                       DEFAULT '1',
    PRIMARY KEY (`rID`)
);

INSERT INTO `room`
VALUES (1, 'gom 1 giuong don 1 phong tam',
        'https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/15679635.jpg?k=b30bec93d0e8f1ea5898a919d99fdb6a2d54014d1fd04b6e7f2ece22c540ccfd&o=&hp=1',
        'single', 'rented', 600000, '1'),
       (2, 'gom 1 giuong doi hoac 2 giuong don va 1 phong tam',
        'https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/15679566.jpg?k=2a295bf165b679f8a04a94c3fa112e84a21f93df4f437b390dc3ac9233cb9bf7&o=&hp=1',
        'vip', 'rented', 700000, '1'),
       (4, 'mo ta 1', 'https://cdn3.ivivu.com/2014/01/SUPER-DELUXE2.jpg', 'single', 'available', 600000, '1'),
       (5, 'mo ta 2',
        'http://chupanhnoithat.vn/upload/images/ch%E1%BB%A5p%20%E1%BA%A3nh%20qu%E1%BA%A3ng%20c%C3%A1o%20kh%C3%A1ch%20s%E1%BA%A1n.jpg',
        'double', 'available', 7000000, '1'),
       (6, 'mo ta 3',
        'http://chupanhnoithat.vn/upload/images/ch%E1%BB%A5p%20h%C3%ACnh%20qu%E1%BA%A3ng%20c%C3%A1o%20kh%C3%A1ch%20s%E1%BA%A1n.JPG',
        'vip', 'rented', 1000000, '1'),
       (7, 'new room 1', 'https://haianhland.com/wp-content/uploads/2019/10/hotel-l%C3%A0-g%C3%AC.jpg', 'single',
        'available', 99999, '1');
CREATE TABLE `user`
(
    `name`      varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `birthday`  datetime                                                     NOT NULL,
    `email`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `password`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `telephone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `avatar`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    PRIMARY KEY (`email`)
) ;
INSERT INTO `user`
VALUES ('dai', '2001-10-26 00:00:00', 'hoa@gmail.com', 'abcd!@#$', '0951736248',
        'https://3.bp.blogspot.com/-Jol8kAcAh5E/WKMFGhnw7II/AAAAAAAAGYE/39Eim0xrRDMatRyvo7CiBWxVYlqDuo6xACEw/s1600/kich-thuoc-anh-3x4.jpg'),
       ('lam', '2002-12-25 00:00:00', 'hung@gmail.com', ' abc1234', '0963852741',
        'https://3.bp.blogspot.com/-Di9C8QOxZWA/WKMFGsEb0sI/AAAAAAAAGYI/925tyV0ICZITqIwmc92xdFw4DvOPcLVBACEw/s1600/anh-6x9.jpg'),
       ('nam', '2003-01-23 00:00:00', 'minh@gmail.com', '1234', '0123456789',
        'https://2.bp.blogspot.com/-OvzSvVKgZ-o/WKMFGVDf2bI/AAAAAAAAGYA/6nSIGSOOAmEpbfpfKsJ393SPT_FCHKPXgCEw/s1600/anh4x6.jpg');
