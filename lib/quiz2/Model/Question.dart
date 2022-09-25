class Question {
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answer;

  Question({
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
  });
}

List<Question> quizQuestions = [
  Question(
    title: ':کې د اوږدوالي واحد عبارت دی له (SI) په',
    option1: 'انج',
    option2: 'میتر',
    option3: 'کیلو متر',
    option4: 'فټ',
    answer: 'فټ',
  ),
  Question(
    title:
        'یو نوری کال د فاصلی هغه واحد دی چې نور یې په یوه کال کې وهي او عددي قیمت یې عبارت دی له 9500 000 000 000 کیلومتره، دا فاصله به څو متره وي؟',
    option1: '9.5 x 10^10 m',
    option2: '9.5 x 10^12 m',
    option3: '9.5 x 10^15 m',
    option4: '9.5 x 1018 m',
    answer: '9.5 x 1018 m',
  ),
  Question(
    title:
        '.که چیرې د یوه اوږدوالي په اندازه کولو کې خپل نظر مستقیماً او یا نیغ په نیغه په خپله اندازه کولو کې ونه ساتئ. له کوم اړخه به ستاسو اندازه کول متاًثره شی',
    option1: 'ستاسی اندازه کول به لږ دقیق وی',
    option2: 'ستاسی اندازه کول به لږ صحیح وي',
    option3: 'ستاسی په اندازه کولو کې به لږ د ارزښت وړ رقمونه موجود وی',
    option4:
        'ستاسی په اندازه کولو کې به د اندازه کولو د وسیلې په واسطه تیروتنه شوې وي',
    answer: 'ستاسی اندازه کول به لږ صحیح وي',
  ),
  Question(
    title:
        'که د شکل مطابق د یوه پنسل د اوږدوالي په اندازه کولو کې تاسې د سانتي متر په واحد ریپورت ورکوئ، څو د ارزښت وړ رقمونه به تاسې ولرئ؟',
    option1: 'یو',
    option2: 'دوه',
    option3: 'دری',
    option4: 'څلور',
    answer: 'یو',
  ),
  Question(
    title: 'د یوې سمې فزیکی معادلې لپاره له لاندې جملو څخه کومه یوه سمه ده؟',
    option1: 'د معادلې دواړه خواوې (طرفونه) باید عین متحولین ولري',
    option2: 'دواړه خواو ته باید متحولین موجود وی، نه عددونه',
    option3: 'داوړه طرفو ته باید عین ابعاد (فزیکی کمیتونه) موجود وی',
    option4: 'دواړه خواوو ته عددونه وی، نه متحولین',
    answer: 'دواړه خواوو ته عددونه وی، نه متحولین',
  ),
  Question(
    title: 'په لاندې اندازو کی څو د ارزښت وړ رقمونه شته دی؟',
    option1: '300 000 000 m/sec',
    option2: '3.00 x 10^8 m/sec',
    option3: '0.006070',
    option4: '1.004',
    answer: '1.004',
  ),
  Question(
    title: ':په لاندې اندازو کې څو د ازرښت وړ قیمتونه شته',
    option1: '78.9+-0.2 m',
    option2: '3.788 x 10^9',
    option3: '2.46 x 10^6',
    option4: '0.0032 mm',
    answer: '2.46 x 10^6',
  ),
];
