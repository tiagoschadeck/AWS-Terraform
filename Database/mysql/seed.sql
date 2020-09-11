USE preferences;

CREATE TABLE preferences (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(250) DEFAULT NULL,
  `preference` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
