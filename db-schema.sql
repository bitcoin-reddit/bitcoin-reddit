DROP TABLE IF EXISTS Comments;
CREATE TABLE Comments (
  "id" SERIAL,
  "text" varchar(1000) NOT NULL,
  "forum" varchar(50) NOT NULL,
  "username" varchar(24) NOT NULL,
  "parent" int NOT NULL,
  "timestamp" bigint NOT NULL,
  PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS Posts;
CREATE TABLE Posts (
  "id" SERIAL,
  "postKey" varchar(10) NOT NULL,
  "title" varchar(150) NOT NULL,
  "text" varchar(1000) NOT NULL,
  "url" varchar(250) NOT NULL,
  "forum" varchar(50) NOT NULL,
  "investors" text[],
  "investment" int NOT NULL,
  "username" varchar(24) NOT NULL,
  "timestamp" bigint NOT NULL,
  PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS Forums;
CREATE TABLE Forums (
  "id" SERIAL,
  "name" varchar(150) NOT NULL,
  "description" varchar(1000) NOT NULL,
  "rules" varchar(1000) NOT NULL,
  "administrator" varchar(24) NOT NULL,
  "timestamp" bigint NOT NULL,
  PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  "id" SERIAL,
  "username" varchar(24) NOT NULL,
  "email" varchar(24) NOT NULL,
  "passwordHash" varchar(44) NOT NULL,
  "salt" varchar(24) NOT NULL,
  "key" varchar(64) NOT NULL,
  "address" varchar(35) NOT NULL,
  "balance" int NOT NULL,
  "joined" bigint NOT NULL,
  PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS Votes;
CREATE TABLE Votes (
  "id" SERIAL,
  "userId" int NOT NULL,
  "postId" int NOT NULL,
  "timestamp" bigint NOT NULL,
  PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment (
  "id" SERIAL,
  "amount" int NOT NULL,
  "transactionHash" varchar(64) NOT NULL,
  "username" varchar(24),
  "kind" varchar(24),
  "timestamp" bigint NOT NULL,
  PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS Wallet;
CREATE TABLE Wallet (
  "id" SERIAL,
  "key" varchar(64) NOT NULL,
  "address" varchar(35) NOT NULL,
  "balance" int NOT NULL,
  "username" varchar(24),
  PRIMARY KEY ("id")
);
