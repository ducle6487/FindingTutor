USE [FindingTutor]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdStudent] [int] NULL,
	[IdTeacher] [int] NULL,
	[DateStart] [date] NULL,
	[Status] [int] NULL,
	[IdCourse] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conservation]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conservation](
	[IdConservation] [int] IDENTITY(1,1) NOT NULL,
	[IdStudent] [int] NULL,
	[IdTeacher] [int] NULL,
 CONSTRAINT [PK_Conservation] PRIMARY KEY CLUSTERED 
(
	[IdConservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[IdCourse] [int] IDENTITY(1,1) NOT NULL,
	[IdGrade] [int] NULL,
	[IdSubject] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreeTime]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreeTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTeacher] [int] NULL,
	[TableIndex] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FreeTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[IdGrade] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[IdGrade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[IdMessage] [int] IDENTITY(1,1) NOT NULL,
	[IdOwner] [int] NULL,
	[ContentMessage] [nvarchar](max) NULL,
	[DateChat] [datetime] NULL,
	[IdConservation] [int] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[IdMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[IdProfile] [int] IDENTITY(1,1) NOT NULL,
	[IdTeacher] [int] NULL,
	[IdCourse] [int] NULL,
 CONSTRAINT [PK_Table_1_1] PRIMARY KEY CLUSTERED 
(
	[IdProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualifications]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualifications](
	[IdQualification] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](500) NULL,
	[Specialized] [nvarchar](500) NULL,
	[Degree] [nvarchar](500) NULL,
	[IdTeacher] [int] NULL,
 CONSTRAINT [PK_Qualifications] PRIMARY KEY CLUSTERED 
(
	[IdQualification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[IdStudent] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](500) NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [decimal](18, 0) NULL,
	[Avatar] [varchar](500) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[IdStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[IdSubject] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [varchar](500) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[IdSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[IdTeacher] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Phone] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[Avatar] [varchar](500) NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[IdTeacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeBooking]    Script Date: 4/19/2021 1:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeBooking](
	[IdTime] [int] IDENTITY(1,1) NOT NULL,
	[IndexTable] [int] NULL,
	[IdBooking] [int] NULL,
 CONSTRAINT [PK_TimeBooking] PRIMARY KEY CLUSTERED 
(
	[IdTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (4, 2, 1, CAST(N'2021-04-20' AS Date), 1, 187)
INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (5, 2, 1, CAST(N'2021-04-29' AS Date), 0, 188)
INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (6, 2, 4, CAST(N'2021-04-20' AS Date), 0, 189)
INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (7, 2, 6, CAST(N'2021-04-21' AS Date), 0, 189)
INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (8, 2, 7, CAST(N'2021-04-27' AS Date), 0, 188)
INSERT [dbo].[Booking] ([Id], [IdStudent], [IdTeacher], [DateStart], [Status], [IdCourse]) VALUES (9, 2, 8, CAST(N'2021-04-22' AS Date), 0, 187)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (187, 54, 15)
INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (188, 55, 15)
INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (189, 56, 15)
INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (190, 57, 15)
INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (191, 58, 15)
INSERT [dbo].[Courses] ([IdCourse], [IdGrade], [IdSubject]) VALUES (192, 59, 15)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[FreeTime] ON 

INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (96, 1, 1, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (97, 1, 2, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (98, 1, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (99, 1, 10, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (100, 1, 17, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (101, 1, 28, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (102, 1, 34, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (103, 1, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (104, 1, 43, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (105, 1, 44, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (106, 1, 50, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (107, 1, 51, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (108, 1, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (109, 1, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (110, 1, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (111, 1, 88, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (112, 1, 96, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (113, 1, 97, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (114, 1, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (115, 1, 100, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (116, 1, 102, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (117, 1, 117, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (118, 2, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (119, 2, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (120, 2, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (121, 2, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (122, 2, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (123, 2, 32, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (124, 2, 38, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (125, 2, 51, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (126, 2, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (127, 2, 63, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (128, 2, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (129, 2, 80, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (130, 2, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (131, 2, 93, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (132, 2, 102, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (133, 2, 110, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (134, 2, 119, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (135, 3, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (136, 3, 7, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (137, 3, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (138, 3, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (139, 3, 20, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (140, 3, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (141, 3, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (142, 3, 33, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (143, 3, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (144, 3, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (145, 3, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (146, 3, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (147, 3, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (148, 4, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (149, 4, 9, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (150, 4, 17, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (151, 4, 25, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (152, 4, 33, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (153, 4, 34, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (154, 4, 40, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (155, 4, 41, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (156, 4, 48, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (157, 4, 49, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (158, 4, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (159, 4, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (160, 4, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (161, 4, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (162, 4, 88, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (163, 4, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (164, 4, 94, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (170, 5, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (171, 5, 8, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (172, 5, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (173, 5, 22, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (174, 5, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (175, 5, 30, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (176, 5, 37, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (177, 5, 46, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (178, 5, 58, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (179, 5, 64, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (180, 5, 73, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (181, 5, 78, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (182, 5, 87, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (183, 6, 4, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (184, 6, 11, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (185, 6, 18, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (186, 6, 25, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (187, 6, 28, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (188, 6, 35, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (189, 6, 42, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (190, 6, 45, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (191, 6, 48, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (192, 6, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (193, 6, 55, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (194, 6, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (195, 6, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (196, 6, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (197, 6, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (198, 6, 72, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (199, 6, 76, 0)
GO
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (200, 6, 79, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (201, 6, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (202, 6, 86, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (203, 6, 96, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (204, 6, 103, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (205, 7, 2, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (206, 7, 9, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (207, 7, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (208, 7, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (209, 7, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (210, 7, 29, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (211, 7, 32, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (212, 7, 36, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (213, 7, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (214, 7, 43, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (215, 7, 48, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (216, 7, 50, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (217, 7, 55, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (218, 7, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (219, 7, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (220, 7, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (221, 7, 70, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (222, 7, 73, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (223, 7, 77, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (224, 7, 80, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (225, 7, 89, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (226, 7, 96, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (227, 7, 103, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (228, 7, 110, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (229, 7, 117, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (230, 8, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (231, 8, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (232, 8, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (233, 8, 19, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (234, 8, 23, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (235, 8, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (236, 8, 29, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (237, 8, 34, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (238, 8, 37, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (239, 8, 44, 1)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (240, 8, 45, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (241, 8, 47, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (242, 8, 53, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (243, 8, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (244, 8, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (245, 8, 63, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (246, 8, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (247, 8, 73, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (248, 8, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (249, 8, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (250, 8, 84, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (251, 8, 89, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (252, 9, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (253, 9, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (254, 9, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (255, 9, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (256, 9, 26, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (257, 9, 33, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (258, 9, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (259, 9, 40, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (260, 9, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (261, 9, 53, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (262, 9, 54, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (263, 9, 65, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (264, 9, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (265, 9, 70, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (266, 9, 71, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (267, 9, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (268, 9, 85, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (269, 9, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (270, 9, 97, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (271, 9, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (272, 9, 99, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (273, 9, 111, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (274, 9, 112, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (275, 9, 113, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (276, 10, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (277, 10, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (278, 10, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (279, 10, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (280, 10, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (281, 10, 45, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (282, 10, 56, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (283, 10, 58, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (284, 10, 60, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (285, 10, 64, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (286, 10, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (287, 10, 71, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (288, 10, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (289, 10, 77, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (290, 10, 79, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (291, 10, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (292, 10, 85, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (293, 10, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (294, 10, 93, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (295, 10, 95, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (296, 10, 96, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (297, 10, 97, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (298, 10, 101, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (299, 10, 109, 0)
GO
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (300, 11, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (301, 11, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (302, 11, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (303, 11, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (304, 11, 33, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (305, 11, 41, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (306, 11, 49, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (307, 11, 55, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (308, 11, 61, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (309, 11, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (310, 11, 73, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (311, 11, 79, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (312, 11, 85, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (313, 11, 93, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (314, 11, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (315, 11, 101, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (316, 11, 104, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (317, 11, 109, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (318, 11, 117, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (319, 13, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (320, 13, 8, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (321, 13, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (322, 13, 22, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (323, 13, 29, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (324, 13, 36, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (325, 13, 44, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (326, 13, 51, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (327, 13, 58, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (328, 13, 65, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (329, 13, 72, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (330, 13, 80, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (331, 13, 87, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (332, 13, 94, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (333, 13, 101, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (334, 13, 108, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (335, 13, 115, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (336, 14, 8, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (337, 14, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (338, 14, 10, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (339, 14, 11, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (340, 14, 12, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (341, 14, 13, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (342, 14, 14, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (343, 14, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (344, 14, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (345, 14, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (346, 14, 18, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (347, 14, 19, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (348, 14, 20, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (349, 14, 21, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (350, 14, 50, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (351, 14, 58, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (352, 14, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (353, 14, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (354, 14, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (355, 14, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (356, 14, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (357, 15, 15, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (358, 15, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (359, 15, 31, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (360, 15, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (361, 15, 45, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (362, 15, 53, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (363, 15, 61, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (364, 15, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (365, 15, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (366, 15, 68, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (367, 15, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (368, 15, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (369, 15, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (370, 15, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (371, 15, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (372, 15, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (373, 15, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (374, 15, 91, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (394, 16, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (395, 16, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (396, 16, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (397, 16, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (398, 16, 31, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (399, 16, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (400, 16, 46, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (401, 16, 47, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (402, 16, 54, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (403, 16, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (404, 16, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (405, 16, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (406, 16, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (407, 16, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (408, 16, 87, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (409, 16, 88, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (410, 16, 94, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (411, 16, 100, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (412, 16, 107, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (413, 17, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (414, 17, 60, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (415, 17, 61, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (416, 17, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (417, 17, 63, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (418, 17, 67, 0)
GO
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (419, 17, 68, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (420, 17, 69, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (421, 17, 70, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (422, 17, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (423, 17, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (424, 17, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (425, 17, 77, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (426, 17, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (427, 17, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (428, 17, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (429, 17, 84, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (430, 18, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (431, 18, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (432, 18, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (433, 18, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (434, 18, 31, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (435, 18, 38, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (436, 18, 46, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (437, 18, 53, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (438, 18, 60, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (439, 18, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (440, 18, 68, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (441, 18, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (442, 18, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (443, 18, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (444, 18, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (445, 18, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (446, 18, 91, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (447, 18, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (448, 18, 104, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (449, 18, 105, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (450, 19, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (451, 19, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (452, 19, 10, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (453, 19, 11, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (454, 19, 12, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (455, 19, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (456, 19, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (457, 19, 18, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (458, 19, 19, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (459, 19, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (460, 19, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (461, 19, 25, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (462, 19, 26, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (463, 19, 30, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (464, 19, 31, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (465, 19, 32, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (466, 19, 33, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (467, 19, 37, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (468, 19, 38, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (469, 19, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (470, 19, 40, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (471, 19, 41, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (472, 19, 42, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (473, 20, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (474, 20, 10, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (475, 20, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (476, 20, 17, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (477, 20, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (478, 20, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (479, 20, 30, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (480, 20, 31, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (481, 20, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (482, 20, 40, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (483, 20, 41, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (484, 20, 46, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (485, 20, 47, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (486, 20, 48, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (487, 20, 53, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (488, 20, 54, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (489, 20, 55, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (490, 20, 60, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (491, 20, 61, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (492, 20, 62, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (493, 21, 1, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (494, 21, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (495, 21, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (496, 21, 30, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (497, 21, 37, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (498, 21, 45, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (499, 21, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (500, 21, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (501, 21, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (502, 21, 74, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (503, 21, 75, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (504, 21, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (505, 21, 81, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (506, 21, 82, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (507, 21, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (508, 21, 88, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (509, 21, 89, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (510, 21, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (511, 21, 95, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (512, 21, 96, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (513, 21, 97, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (514, 22, 9, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (515, 22, 16, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (516, 22, 23, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (517, 22, 30, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (518, 22, 38, 0)
GO
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (519, 22, 45, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (520, 22, 52, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (521, 22, 59, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (522, 22, 66, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (523, 22, 67, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (524, 23, 24, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (525, 23, 32, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (526, 23, 39, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (527, 23, 46, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (528, 23, 54, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (529, 23, 61, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (530, 23, 68, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (531, 23, 76, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (532, 23, 83, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (533, 23, 90, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (534, 23, 98, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (535, 23, 105, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (536, 23, 112, 0)
INSERT [dbo].[FreeTime] ([Id], [IdTeacher], [TableIndex], [Status]) VALUES (537, 23, 119, 0)
SET IDENTITY_INSERT [dbo].[FreeTime] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (54, N'IELTS')
INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (55, N'TOEFL')
INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (56, N'BASIC')
INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (57, N'SPEAKING')
INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (58, N'READING')
INSERT [dbo].[Grades] ([IdGrade], [Grade]) VALUES (59, N'LISTENING')
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (5, 2, 192)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (6, 2, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (7, 2, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (8, 3, 192)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (9, 4, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (10, 4, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (11, 4, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (12, 5, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (13, 5, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (14, 6, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (15, 6, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (16, 7, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (17, 7, 192)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (18, 8, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (19, 8, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (20, 9, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (21, 10, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (22, 10, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (23, 11, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (24, 11, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (25, 11, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (30, 1, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (31, 1, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (32, 1, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (33, 1, 192)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (34, 13, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (35, 13, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (36, 14, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (37, 14, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (38, 15, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (39, 15, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (40, 15, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (41, 15, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (42, 15, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (43, 16, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (44, 16, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (45, 16, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (46, 17, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (47, 17, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (48, 17, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (49, 18, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (50, 18, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (51, 18, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (52, 19, 188)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (53, 19, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (54, 19, 190)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (55, 20, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (56, 20, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (57, 20, 192)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (58, 21, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (59, 21, 191)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (60, 22, 187)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (61, 22, 189)
INSERT [dbo].[Profile] ([IdProfile], [IdTeacher], [IdCourse]) VALUES (62, 23, 187)
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([IdStudent], [Email], [Password], [Name], [Phone], [Avatar]) VALUES (2, N'ducle6487@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Anh Duc Le', CAST(397067907 AS Decimal(18, 0)), N'ss.jfif')
INSERT [dbo].[Student] ([IdStudent], [Email], [Password], [Name], [Phone], [Avatar]) VALUES (3, N'leduc6487@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Anh Duc Le', CAST(397067907 AS Decimal(18, 0)), N'Avatar.png')
INSERT [dbo].[Student] ([IdStudent], [Email], [Password], [Name], [Phone], [Avatar]) VALUES (4, N'duc@gmaisdal.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Anhducle', CAST(397067907 AS Decimal(18, 0)), N'Avatar.png')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([IdSubject], [Name], [Image]) VALUES (15, N'Tiếng Anh', NULL)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (1, N'teacher@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Anh Đức', CAST(397067907 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), N'126844893_3223729304519964_2214338714879604751_n.jpg', N'                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (2, N'teacher1@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Thúy An', CAST(862322347 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), N'ff.png', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (3, N'teacher2@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Phạm Hoàng Yến', CAST(329489279 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), N'images (1).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (4, N'teacher3@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Anh Thư', CAST(336888907 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), N'images (3).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (5, N'teacher4@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Hoàng Mai Anh', CAST(397008086 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), N'images (4).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (6, N'teacher5@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Minh Khang', CAST(377753353 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), N'images (2).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (7, N'teacher6@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Hoài Anh', CAST(964844784 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), N'images (6).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (8, N'teacher7@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Ngọc Xuân Nghi', CAST(382245739 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), N'images (7).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (9, N'teacher8@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Đặng Ánh Mai', CAST(333215553 AS Decimal(18, 0)), CAST(170000 AS Decimal(18, 0)), N'images (8).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (10, N'teacher9@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Phạm Kiều Đoan Trang', CAST(345123239 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), N'images (9).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (11, N'teacher10@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Phạm Hữu Đạt', CAST(343683663 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), N'images.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (13, N'teacher11@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Đặng Ngọc Anh', CAST(346421420 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), N's.jfif', N'                                                                                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        
                        
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (14, N'teacher12@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Phương Tố Như', CAST(862916139 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), N'd.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (15, N'teacher13@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Đặng Thiện Nhân', CAST(375217388 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), N'dd.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (16, N'teacher14@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Ngọc Đan Tâm', CAST(336070735 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), N'df.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (17, N'teacher15@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Phạm Nhật Minh', CAST(354080858 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), N'images (10).jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (18, N'teacher16@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Nguyễn Bình An', CAST(868803459 AS Decimal(18, 0)), CAST(140000 AS Decimal(18, 0)), N'ggg.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (19, N'teacher17@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Trần Khánh Quỳnh', CAST(372114611 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), N'shshs.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (20, N'teacher18@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Quỳnh Thư', CAST(378746368 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), N'ss.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (21, N'teacher19@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Đặng Minh Ân', CAST(374099309 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), N'ff.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (22, N'teacher20@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Lê Tuấn Anh', CAST(354080858 AS Decimal(18, 0)), CAST(140000 AS Decimal(18, 0)), N'ssssss.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
INSERT [dbo].[Teacher] ([IdTeacher], [Email], [Password], [Name], [Phone], [Price], [Avatar], [Bio]) VALUES (23, N'teacher21@gmail.com', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'Phạm Mỹ Duyên', CAST(964844784 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), N'ssssss.jfif', N'                                                                                                                                I lived abroad for many years teaching in the British School of Rio de Janeiro and have experience teaching KS2, KS3, GCSE and IB students. I have also taught University Level classes in pedagogy and the art of teaching. I have experience working with SEN children and encouraging those with learning difficulties to reach their full potential.      
                        ')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeBooking] ON 

INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (19, 1, 4)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (20, 2, 4)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (21, 10, 5)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (22, 17, 5)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (23, 9, 6)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (24, 17, 6)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (25, 25, 6)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (26, 18, 7)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (27, 25, 7)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (28, 45, 7)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (29, 2, 8)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (30, 9, 8)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (31, 23, 9)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (32, 37, 9)
INSERT [dbo].[TimeBooking] ([IdTime], [IndexTable], [IdBooking]) VALUES (33, 44, 9)
SET IDENTITY_INSERT [dbo].[TimeBooking] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Student] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[Student] ([IdStudent])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Student]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([IdTeacher])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Teacher]
GO
ALTER TABLE [dbo].[Conservation]  WITH CHECK ADD  CONSTRAINT [FK_Conservation_Student] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[Student] ([IdStudent])
GO
ALTER TABLE [dbo].[Conservation] CHECK CONSTRAINT [FK_Conservation_Student]
GO
ALTER TABLE [dbo].[Conservation]  WITH CHECK ADD  CONSTRAINT [FK_Conservation_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([IdTeacher])
GO
ALTER TABLE [dbo].[Conservation] CHECK CONSTRAINT [FK_Conservation_Teacher]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Grades] FOREIGN KEY([IdGrade])
REFERENCES [dbo].[Grades] ([IdGrade])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Grades]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Subjects] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subjects] ([IdSubject])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Subjects]
GO
ALTER TABLE [dbo].[FreeTime]  WITH CHECK ADD  CONSTRAINT [FK_FreeTime_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([IdTeacher])
GO
ALTER TABLE [dbo].[FreeTime] CHECK CONSTRAINT [FK_FreeTime_Teacher]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Conservation] FOREIGN KEY([IdConservation])
REFERENCES [dbo].[Conservation] ([IdConservation])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Conservation]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Courses]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([IdTeacher])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Teacher]
GO
ALTER TABLE [dbo].[Qualifications]  WITH CHECK ADD  CONSTRAINT [FK_Qualifications_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([IdTeacher])
GO
ALTER TABLE [dbo].[Qualifications] CHECK CONSTRAINT [FK_Qualifications_Teacher]
GO
ALTER TABLE [dbo].[TimeBooking]  WITH CHECK ADD  CONSTRAINT [FK_TimeBooking_Booking] FOREIGN KEY([IdBooking])
REFERENCES [dbo].[Booking] ([Id])
GO
ALTER TABLE [dbo].[TimeBooking] CHECK CONSTRAINT [FK_TimeBooking_Booking]
GO
