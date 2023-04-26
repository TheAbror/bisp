class GlobalConstants {
  static final List<Map<String, dynamic>> demoTasks = [
    {
      'id': 1,
      'title': 'Find History teacher - Mrs. Green',
      'hint': 'Mrs. Green is also a musician and trains the school orchestra for performances.',
      'done': false,
    },
  ];

  static final List<Map<String, dynamic>> newTask = [
    {
      'id': 2,
      'title': 'Find Math teacher - Ms. Green',
      'hint': 'Ms. Green is also a musician and trains the school orchestra for performances.',
      'done': false,
    },
  ];

  static final List<Map<String, dynamic>> introMessages = [
    {
      'text': 'Welcome to your first EduNinja tutorial',
      'has_next': true,
    },
    {
      'text': 'Today you will learn about Biology Concepts — it is a scientific study of life.',
      'has_next': true,
    },
    {
      'text':
          'You should try to accomplish all tasks given in your task bar (on the left-top corner of the screen) and follow the instructions.',
      'has_next': true,
    },
    {
      'text':
          'This tutorial series will consist of 5 parts. Some tasks are mandatory, but there are also optional tasks, which can give you a bonus points.',
      'has_next': true,
    },
    {
      'text':
          'Also, you can make this tutorials together with your friends or other students, who are online. Make connections and try to colloborate with your new friends and you will get additional points of experience for communication.',
      'has_next': true,
    },
    {
      'text': 'First task: go to whiteboard in Room 101',
      'has_next': false,
    },
    {
      'text': 'Good luck and have fun!',
      'has_next': false,
    },
  ];

  static final List<Map<String, dynamic>> playerMessages = [
    {
      'player_nick': 'Mrs. Green',
      'messages': [
        {
          'id': 1,
          'text': 'Good morning, Christie! How can I help you?',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 2,
          'text':
              'Good morning, Mrs. Green! I would like to learn more about The Civil War. What would you suggest to study?',
          'has_next': true,
          'is_local_player_message': true,
        },
        {
          'id': 3,
          'text':
              'First of all, you can go to the dedicated room and watch the video material about this topic. Then you can read a little bit about it on a textbook.',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 4,
          'text':
              'But Nancy borrowed the book from me last week and I saw her couple minutes ago in canteen. You can get the book from her.',
          'has_next': false,
          'is_local_player_message': false,
          'tasks_done': [1],
          'new_progress': 35.0,
          'new_tasks': [
            {
              'id': 2,
              'title': 'Go to history class and watch video on projector.',
              'hint': 'History classes are usually held on #101 and #102 room.',
              'done': false,
            },
            {
              'id': 3,
              'title': 'Find Nancy and ask for textbook.',
              'hint': null,
              'done': false,
            },
          ]
        },
      ]
    },
    {
      'player_nick': 'Ethan',
      'messages': [
        {
          'id': 1,
          'text': 'Hello, Ethan! Have you seen Nancy recently? Our History teacher Mrs. Green told me she was here.',
          'has_next': true,
          'is_local_player_message': true,
        },
        {
          'id': 2,
          'text': 'Hi, Christie!',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 3,
          'text': 'Yes, she was here, but she left just before you came. I think she said she wanted to go to Library.',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 4,
          'text': 'Oh, I see. Thank you, Ethan. See you later!',
          'has_next': false,
          'is_local_player_message': true,
          'new_tasks': []
        },
      ]
    },
    {
      'player_nick': 'Nancy',
      'messages': [
        {
          'id': 1,
          'text': 'Hi, Nan! How are you doing?',
          'has_next': true,
          'is_local_player_message': true,
        },
        {
          'id': 2,
          'text': 'Hi, Christie! I\'m fine. What about you?',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 3,
          'text': 'I\'m great, thanks!',
          'has_next': true,
          'is_local_player_message': true,
        },
        {
          'id': 4,
          'text': 'Mrs. Green told me you have a textbook for history about The Civil War. Can I borrow it, please?',
          'has_next': true,
          'is_local_player_message': true,
        },
        {
          'id': 5,
          'text': 'Sure. But I left it on Biology class on the desk. You can find it there.',
          'has_next': true,
          'is_local_player_message': false,
        },
        {
          'id': 6,
          'text': 'Okay! I\'ll go there then. Thank you very much!',
          'has_next': false,
          'is_local_player_message': true,
          'tasks_done': [3],
          'new_progress': 75.0,
          'new_tasks': [
            {
              'id': 4,
              'title': 'Get a textbook from biology class and read the material.',
              'hint': 'Biology classes are usually held on #103 and #104 room.',
              'done': false,
            },
          ]
        },
      ]
    },
  ];
}
