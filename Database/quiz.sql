GO
/****** Object:  Table [dbo].[options]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[question]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[question_type]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[quiz]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[quiz_questions]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[quiz_response]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[quiz_summary]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[quiz_users]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[team]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[team_users]    Script Date: 24-07-2021 13:50:26 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 24-07-2021 13:50:26 ******/
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
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (70, 22, N'Google', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (71, 22, N'Microsoft', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (72, 22, N'Apple', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (73, 22, N'Amazon', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (74, 23, N'good', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (75, 23, N'bad', 0)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (76, 23, N'Neutral', 1)
INSERT [dbo].[options] ([id], [question_id], [choice_text], [iscorrect]) VALUES (77, 23, N'None of the above', 0)
SET IDENTITY_INSERT [dbo].[options] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (1, N'Which among the following is the most common media of pollination in flowers without petals??', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (2, N'Which among the following plant hormone plays most important role in establishing dormancy in seeds?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (3, N'The angle of incidence for a ray of light having zero reflection angle is', 1, 1, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (5, N'Which city is the venue of the Shanghai Cooperation Organisation (SCO) meeting 2021?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (6, N' Which country has exported apples to India, for the first time on 50 years?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (7, N'Where is the National Forensic Science University located in India?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (9, N'Which institution released the report titled “The Hunger Virus Multiplies”?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (10, N'Pithampur, where Asia’s longest high-speed test track- NATRAX has been inaugurated, is located in which state?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (11, N'What is the name of the nodal agency that will regulate space activities and the use of ISRO facilities by private sector?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (15, N'Which technology company launched a new file-sharing feature ‘Nearby Share’?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (17, N'Which Telescope detected the immense envelope of gas called ‘Halo’ which surrounds the Andromeda galaxy?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (18, N'Which company has signed a deal with TikTok to be a trusted technology provider in USA?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (19, N'Indian Space Research Organisation (ISRO) is set to launch Venus mission by which year?', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (20, N'Which country has unveiled a draft “Humans in space policy 2021”?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (22, N'NASSCOM has partnered with which technology company to launch ‘AI Gamechangers’ programme?', 1, 3, 1, CAST(10.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (23, N'How are you?', 0, 1, 1, CAST(10.00 AS Decimal(5, 2)), CAST(-2.00 AS Decimal(5, 2)))
INSERT [dbo].[question] ([id], [question], [isactive], [difficulty_level], [question_type_id], [points], [negative_points]) VALUES (24, N'HI ', 1, 2, 1, CAST(10.00 AS Decimal(5, 2)), CAST(-2.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[question_type] ON 

INSERT [dbo].[question_type] ([id], [name]) VALUES (1, N'MCQ')
INSERT [dbo].[question_type] ([id], [name]) VALUES (2, N'Timer')
INSERT [dbo].[question_type] ([id], [name]) VALUES (3, N'Buzzer')
SET IDENTITY_INSERT [dbo].[question_type] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (1, N'quiz1', 1, CAST(N'2021-07-24T11:50:00.000' AS DateTime), CAST(N'2021-07-24T16:50:00.000' AS DateTime), 1)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (2, N'quiz2', 2, CAST(N'2021-09-03T01:20:00.000' AS DateTime), CAST(N'2021-09-03T02:20:00.000' AS DateTime), 0)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (3, N'quiz3', 3, CAST(N'2021-11-03T01:20:00.000' AS DateTime), CAST(N'2021-11-03T01:20:00.000' AS DateTime), 0)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (4, N'quiz4 ', 1, CAST(N'2021-10-03T01:20:00.000' AS DateTime), CAST(N'2021-10-03T02:20:00.000' AS DateTime), 0)
INSERT [dbo].[quiz] ([id], [name], [difficulty_level], [start_time], [end_time], [is_published]) VALUES (5, N'quiz5 ', 2, CAST(N'2021-12-03T01:20:00.000' AS DateTime), CAST(N'2021-12-03T02:20:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_questions] ON 

INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (30, 1, 1)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (31, 1, 2)
INSERT [dbo].[quiz_questions] ([id], [quizid], [questionid]) VALUES (32, 1, 3)
SET IDENTITY_INSERT [dbo].[quiz_questions] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_response] ON 

INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (2, 1, 3, 1, 2)
INSERT [dbo].[quiz_response] ([id], [quiz_id], [user_id], [question_id], [option_id]) VALUES (3, 1, 3, 3, 12)
SET IDENTITY_INSERT [dbo].[quiz_response] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_summary] ON 

INSERT [dbo].[quiz_summary] ([id], [quiz_id], [user_id], [current_question_id]) VALUES (2, 1, 3, 3)
SET IDENTITY_INSERT [dbo].[quiz_summary] OFF
GO
SET IDENTITY_INSERT [dbo].[quiz_users] ON 

INSERT [dbo].[quiz_users] ([id], [user_id], [quiz_id]) VALUES (5, 3, 1)
SET IDENTITY_INSERT [dbo].[quiz_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (1, N'sanya', 1, N'zaverisanya@gmail.com', 1, N'sanya1234')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (2, N'priyal', 1, N'priyal@yahoo.in', 0, N'pri1245')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (3, N'jimisha', 1, N'xyz@gmail.com', 0, N'jimi1234')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (5, N'devansh`', 1, N'dnzaveri_69@rediffmail.com', 0, N'lila1612')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (6, N'Courtney', 1, N'annette37@cruickshank.biz', 0, N'kjknkdjkjieojoj')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (9, N'Raheen ', 1, N'rubye.okuneva@yahoo.com', 0, N'akdfdkjfkkdjf')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (10, N'Sandra ', 1, N'hnicolas@osinski.info', 0, N'kkljfl039jflaskjf29')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (11, N'Holly', 1, N'ucrooks@corwin.com', 0, N'fjdljlortoruotiu35')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (12, N'Danyka', 1, N'plowe@quigley.com', 0, N'kjfslvnskdjfieowa234234')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (13, N'Dallin', 1, N'augustine.richie@hotmail.com', 0, N'ljflsdkj383939')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (14, N'Doug', 1, N'hudson.otha@hegman.biz', 0, N'jflsfjslfjsl34556')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (16, N'Mahesh', 1, N'mahesh_12@asia.com', 0, N'wugj37fh48tje9')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (17, N'Anamay', 1, N'anamay23@rediffmail.com', 0, N'anamay78@shah')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (18, N'Akshay', 1, N'akshay.z@yahoo.com', 0, N'akshaykhanna1234')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (20, N'Devni', 1, N'devnishah@gmail.com', 0, N'devnishah082001')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (21, N'devu', 1, N'devashree@gmail.com', 0, N'devu1234')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (24, N'arya', 1, N'arya@ijdis.com', 0, N'jsijadi')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (25, N'mfki', 1, N'zaverisanya@gmail.com', 0, N'sanu2909')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (26, N'saaaa', 1, N'asd@md.com', 0, N'sanu2909')
INSERT [dbo].[users] ([user_id], [username], [isactive], [email], [isadmin], [password]) VALUES (27, N'sanyaa', 1, N'zaverisanya@gmail.comm', 0, N'sanya1234')
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
