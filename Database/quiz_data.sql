USE [quizdemo1]
GO

GO
/****** Object:  Table [dbo].[options]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[options](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[choice_text] [varchar](100) NOT NULL,
	[iscorrect] [bit] NOT NULL,
 CONSTRAINT [PK_options] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](500) NOT NULL,
	[isactive] [bit] NOT NULL,
	[difficulty_level] [smallint] NOT NULL,
	[question_type_id] [int] NOT NULL,
	[points] [decimal](5, 2) NOT NULL,
	[negative_points] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_type]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_question_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[difficulty_level] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[is_published] [bit] NOT NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_questions]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quizid] [int] NULL,
	[questionid] [int] NULL,
 CONSTRAINT [PK_quiz_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_response]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_response](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[option_id] [int] NOT NULL,
 CONSTRAINT [PK_quiz_response] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_summary]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_summary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[current_question_id] [int] NOT NULL,
 CONSTRAINT [PK_quiz_summary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_users]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
 CONSTRAINT [PK_quiz_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team_users]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_team_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 25-07-2021 19:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[isactive] [bit] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[isadmin] [bit] NOT NULL,
	[password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[options] ON 

INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (2, 1, N'wind', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (3, 1, N'water', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (4, 1, N'insects', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (6, 1, N'all of the above', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (8, 2, N'ethylene', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (9, 2, N'gibbererellic acid', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (10, 2, N'abscisic acid', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (11, 2, N'auxin', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (12, 3, N'0', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (15, 3, N'30', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (16, 3, N'45', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (17, 3, N'90', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (18, 5, N' Dushanbe', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (20, 5, N'Moscow', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (21, 5, N'Shangai', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (23, 5, N'New Delhi', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (24, 6, N'China', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (25, 6, N'Israel', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (26, 6, N'UK', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (27, 6, N'Australia', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (28, 7, N'Ahmedabad', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (31, 7, N'Mumbai', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (33, 7, N'Mysuru', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (34, 7, N'Chennai', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (35, 9, N'World Bank', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (36, 9, N'UNICEF', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (37, 9, N'Oxfam', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (38, 9, N'Bill and Melinda Gates Foundation', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (39, 10, N'Tamil Nadu', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (40, 10, N'Madhya Pradesh', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (41, 10, N'Maharashtra', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (42, 10, N' Gujarat', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (45, 11, N'NSIL', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (46, 11, N'IN-SPACe', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (47, 11, N'Space India', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (48, 11, N'Bharat Space', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (49, 15, N' Microsoft', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (50, 15, N'google', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (51, 15, N'facebook', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (52, 15, N'apple', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (53, 17, N'Spitzer Space Telescope', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (54, 17, N' Hubble Space Telescope', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (55, 17, N'Chandra X-ray Observatory', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (56, 17, N'Kepler Telescope', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (57, 18, N'Microsoft', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (58, 18, N'Adobe', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (60, 18, N'Oracle', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (61, 18, N'HP', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (62, 19, N'2022', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (63, 19, N'2023', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (64, 19, N'2025', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (65, 19, N'2030', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (66, 20, N'Japan', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (67, 20, N' India', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (68, 20, N'China', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (69, 20, N'USA', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (70, 22, N'Google', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (71, 22, N'Microsoft', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (72, 22, N'Apple', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (73, 22, N'Amazon', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (106, 41, N'wr', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (107, 41, N'wro', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (108, 41, N'rr', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (109, 41, N'right', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (110, 42, N'demo1', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (111, 42, N'demo2', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (112, 42, N'demo3', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (113, 42, N'demo4', 0)
SET IDENTITY_INSERT [dbo].[options] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (1, N'Which among the following is the most common media of pollination in flowers without petals??', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (2, N'Which among the following plant hormone plays most important role in establishing dormancy in seeds?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (3, N'The angle of incidence for a ray of light having zero reflection angle is', 1, 1, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (5, N'Which city is the venue of the Shanghai Cooperation Organisation (SCO) meeting 2021?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (6, N' Which country has exported apples to India, for the first time on 50 years?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (7, N'Where is the National Forensic Science University located in India?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (9, N'Which institution released the report titled “The Hunger Virus Multiplies”?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (10, N'Pithampur, where Asia’s longest high-speed test track- NATRAX has been inaugurated, is located in which state?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (11, N'What is the name of the nodal agency that will regulate space activities and the use of ISRO facilities by private sector?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (15, N'Which technology company launched a new file-sharing feature ‘Nearby Share’?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (17, N'Which Telescope detected the immense envelope of gas called ‘Halo’ which surrounds the Andromeda galaxy?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (18, N'Which company has signed a deal with TikTok to be a trusted technology provider in USA?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (19, N'Indian Space Research Organisation (ISRO) is set to launch Venus mission by which year?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (20, N'Which country has unveiled a draft “Humans in space policy 2021”?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (22, N'NASSCOM has partnered with which technology company to launch ‘AI Gamechangers’ programme?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (41, N'test ques', 0, 1, 1, CAST(10.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (42, N'demo question', 1, 1, 1, CAST(10.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[question_type] ON 

INSERT [dbo].[question_type] ([id], [name]) VALUES (1, N'MCQ')
INSERT [dbo].[question_type] ([id], [name]) VALUES (2, N'Timer')
INSERT [dbo].[question_type] ([id], [name]) VALUES (3, N'Buzzer')
SET IDENTITY_INSERT [dbo].[question_type] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (14, N'DemoQuiz', 1, CAST(N'2021-07-25T18:46:00.000' AS DateTime), CAST(N'2021-07-25T19:46:00.000' AS DateTime), 1)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (15, N'DemoQuiz1', 2, CAST(N'2021-07-26T19:00:00.000' AS DateTime), CAST(N'2021-07-26T20:00:00.000' AS DateTime), 1)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (16, N'DemoQuiz2', 3, CAST(N'2021-07-27T10:00:00.000' AS DateTime), CAST(N'2021-07-27T12:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_questions] ON 

INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (102, 14, 1)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (103, 14, 2)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (104, 14, 3)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (105, 14, 5)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (106, 14, 6)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (110, 16, 11)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (111, 16, 18)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (112, 16, 20)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (113, 16, 42)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (114, 15, 9)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (115, 15, 19)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (116, 15, 42)
SET IDENTITY_INSERT [dbo].[quiz_questions] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_response] ON 

INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (78, 14, 29, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (79, 14, 29, 2, 10)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (80, 14, 29, 3, 12)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (81, 14, 29, 5, 23)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (82, 14, 29, 6, 26)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (83, 14, 30, 1, 3)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (84, 14, 30, 2, 9)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (85, 14, 30, 3, 12)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (86, 14, 30, 5, 21)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (87, 14, 30, 6, 24)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (88, 14, 31, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (89, 14, 31, 2, 10)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (90, 14, 31, 3, 15)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (91, 14, 31, 5, 21)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (92, 14, 31, 6, 27)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (93, 14, 32, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (94, 14, 32, 2, 11)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (95, 14, 32, 3, 12)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (96, 14, 32, 5, 20)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (97, 14, 32, 6, 24)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (98, 14, 33, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (99, 14, 33, 2, 10)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (100, 14, 33, 3, 12)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (101, 14, 33, 5, 21)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (102, 14, 33, 6, 26)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (103, 14, 34, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (104, 14, 34, 2, 10)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (105, 14, 34, 3, 12)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (106, 14, 34, 5, 18)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (107, 14, 34, 6, 26)
SET IDENTITY_INSERT [dbo].[quiz_response] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_summary] ON 

INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (3, 14, 29, 6)
INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (4, 14, 30, 6)
INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (5, 14, 31, 6)
INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (6, 14, 32, 6)
INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (7, 14, 33, 6)
INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (8, 14, 34, 6)
SET IDENTITY_INSERT [dbo].[quiz_summary] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_users] ON 

INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (34, 29, 14)
INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (35, 30, 14)
INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (36, 31, 14)
INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (37, 32, 14)
INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (38, 33, 14)
INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (39, 34, 14)
SET IDENTITY_INSERT [dbo].[quiz_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (1, N'admin', 1, N'admin@gmail.com', 1, N'password')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (29, N'user', 1, N'user@gmail.com', 0, N'user')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (30, N'user1', 1, N'user1@gmail.com', 0, N'user1')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (31, N'user2', 1, N'user2@gmail.com', 0, N'user2')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (32, N'user3', 1, N'user3@gmail.com', 0, N'user3')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (33, N'user4', 1, N'user4@gmail.com', 0, N'user4')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (34, N'user5', 1, N'user5@gmail.com', 0, N'user5')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[options]  WITH CHECK ADD  CONSTRAINT [FK_options_question] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[options] CHECK CONSTRAINT [FK_options_question]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_question_type] FOREIGN KEY([question_type_id])
REFERENCES [dbo].[question_type] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_question_type]
GO
ALTER TABLE [dbo].[quiz_questions]  WITH CHECK ADD  CONSTRAINT [FK_quiz_questions_question] FOREIGN KEY([questionid])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[quiz_questions] CHECK CONSTRAINT [FK_quiz_questions_question]
GO
ALTER TABLE [dbo].[quiz_questions]  WITH CHECK ADD  CONSTRAINT [FK_quiz_questions_quiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quiz_questions] CHECK CONSTRAINT [FK_quiz_questions_quiz]
GO
ALTER TABLE [dbo].[quiz_response]  WITH CHECK ADD  CONSTRAINT [FK_quiz_response_options] FOREIGN KEY([option_id])
REFERENCES [dbo].[options] ([id])
GO
ALTER TABLE [dbo].[quiz_response] CHECK CONSTRAINT [FK_quiz_response_options]
GO
ALTER TABLE [dbo].[quiz_response]  WITH CHECK ADD  CONSTRAINT [FK_quiz_response_question] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[quiz_response] CHECK CONSTRAINT [FK_quiz_response_question]
GO
ALTER TABLE [dbo].[quiz_response]  WITH CHECK ADD  CONSTRAINT [FK_quiz_response_quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quiz_response] CHECK CONSTRAINT [FK_quiz_response_quiz]
GO
ALTER TABLE [dbo].[quiz_response]  WITH CHECK ADD  CONSTRAINT [FK_quiz_response_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[quiz_response] CHECK CONSTRAINT [FK_quiz_response_users]
GO
ALTER TABLE [dbo].[quiz_summary]  WITH CHECK ADD  CONSTRAINT [FK_quiz_summary_question] FOREIGN KEY([current_question_id])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[quiz_summary] CHECK CONSTRAINT [FK_quiz_summary_question]
GO
ALTER TABLE [dbo].[quiz_summary]  WITH CHECK ADD  CONSTRAINT [FK_quiz_summary_quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quiz_summary] CHECK CONSTRAINT [FK_quiz_summary_quiz]
GO
ALTER TABLE [dbo].[quiz_summary]  WITH CHECK ADD  CONSTRAINT [FK_quiz_summary_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[quiz_summary] CHECK CONSTRAINT [FK_quiz_summary_users]
GO
ALTER TABLE [dbo].[quiz_users]  WITH CHECK ADD  CONSTRAINT [FK_quiz_users_quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quiz_users] CHECK CONSTRAINT [FK_quiz_users_quiz]
GO
ALTER TABLE [dbo].[quiz_users]  WITH CHECK ADD  CONSTRAINT [FK_quiz_users_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[quiz_users] CHECK CONSTRAINT [FK_quiz_users_users]
GO
ALTER TABLE [dbo].[team_users]  WITH CHECK ADD  CONSTRAINT [FK_team_users_team] FOREIGN KEY([team_id])
REFERENCES [dbo].[team] ([id])
GO
ALTER TABLE [dbo].[team_users] CHECK CONSTRAINT [FK_team_users_team]
GO
ALTER TABLE [dbo].[team_users]  WITH CHECK ADD  CONSTRAINT [FK_team_users_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[team_users] CHECK CONSTRAINT [FK_team_users_users]
GO
USE [master]
GO
ALTER DATABASE [quiz_webapp] SET  READ_WRITE 
GO
