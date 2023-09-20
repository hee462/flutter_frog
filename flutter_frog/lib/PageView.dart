import 'package:flutter/material.dart';
import 'package:hello/end.dart';
import 'package:hello/strat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageList extends StatefulWidget {
  const PageList({super.key, this.forg});
  final String? forg;

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  SharedPreferences? _prefs;
  String imagePath = "images/Listcover.png";

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      String? selectedFrog = _prefs!.getString('selectedFrog');
      if (selectedFrog != null) {
        setState(() {
          if (selectedFrog == '청개구리') {
            imagePath = "images/chungF.png";
            buttonText = '자세히 보기';
          }
        });
        setState(() {
          if (selectedFrog == '산개구리') {
            imagePath3 = "images/sanF.png";
            buttonText3 = "자세히보기";
          }
        });
        setState(() {
          if (selectedFrog == '금개구리') {
            imagePath4 = "images/goldF.png";
            buttonText4 = "자세히보기";
          }
        });
        setState(() {
          if (selectedFrog == '참개구리') {
            imagePath6 = "images/chamF.png";
            buttonText6 = "자세히보기";
          }
        });
      }
    });
  }

// 앱을 초기화할 때 SharedPreferences에서 값을 삭제
  void _clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedFrog');
  }

  String imagePath2 = "images/Listcover.png";
  String imagePath3 = "images/Listcover.png";
  String imagePath4 = "images/Listcover.png";
  String imagePath5 = "images/Listcover.png";
  String imagePath6 = "images/Listcover.png";
  String buttonText = "눌러주세요";
  String buttonText2 = "눌러주세요";
  String buttonText3 = "눌러주세요";
  String buttonText4 = "눌러주세요";
  String buttonText5 = "눌러주세요";
  String buttonText6 = "눌러주세요";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("개구리 도감"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: const Text('게임을 다시 할까요?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PageEnd()));
                                  },
                                  child: const Text('다른 개구리 획득하기')),
                              TextButton(
                                  onPressed: () {
                                    _clearSharedPreferences();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PageStart()));
                                  },
                                  child: const Text('초기화하기'))
                            ],
                          ));
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onLongPress: () async {
                debugPrint(widget.forg);
                if (widget.forg == '청개구리') {
                  setState(() {
                    imagePath = "images/chungF.png";
                    buttonText = "자세히보기";
                  });
                  if (_prefs != null) {
                    await _prefs!.setString('selectedFrog', '청개구리');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('다른 개구리카드를 선택해주세요!')));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 10, 20),
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('수원청개구리'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text('청개구리는 청개구리 과입니다'),
                            Text(
                                '청개구리 특징 :청개구리가 큰소리로 짝 찾으면서 천적을 피할 수 있는 비결은 다른 수컷이 울기를 기다리다 울음소리가 들린 직후, 거의 동시에 울어, 먼저 우는 소리에 자기 소리를 숨기는 것이다. 비슷한 소리가 연달아 들리면 뒷소리를 무시하고 앞소리만 듣는 일종의 착각인 ‘선행음 효과’를 이용하는 것이다'),
                            Text(
                                '일반 청개구리와 구분 하는 법 :모습이 청개구리(Dryophytes japonicus)와 비슷하나 주둥이의 미묘한 각도, 울음소리로 구분이 가능하다. 청개구리는 *꽥꽥꽥꽥꽥꽥* 하는 중저음의 빠른 박자로 소리를 내고, 수원청개구리는 *끅 끅 끅 끅* 하고 느린 박자의 금속성 소리를 낸다'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'))
                      ],
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath2,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onLongPress: () {
                if (widget.forg == '') {}
                setState(() {
                  imagePath2 = "images/Listcover.png";
                  buttonText2 = "  꽝입니다";
                });
                if (widget.forg != "") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("다른 개구리 카드를 선택하세요")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 90, 10, 0),
                child: Text(
                  buttonText2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath3,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),

            child: GestureDetector(
              onLongPress: () async {
                debugPrint("@@@@@@@@@@@@@@@@@@@@");
                if (widget.forg == '산개구리') {
                  setState(() async {
                    imagePath3 = "images/sanF.png";
                    buttonText3 = "자세히보기";
                  });
                  if (_prefs != null) {
                    await _prefs!.setString('selectedFrog', '산개구리');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('다른 개구리 카드를 선택해주세요!'),
                  ));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 10, 20),
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('산개구리'),
                      content: const SingleChildScrollView(
                        child: ListBody(children: [
                          Text(
                              '산개구리 특징 :우리나라에 서식하는 산개구리류 중에서 가장 작은 종이며, 몸 전체의 색은 진한 갈색을 띤다. 주둥이 앞부터 콧구멍과 눈을 지나 주둥이 뒷부분까지 검은 무늬가 이어져 있다. 윗입술을 따라 주둥이 전체에 흰색의 가는 줄무늬가 있는 것이 특징이다'),
                          Text('울음소리  : ‘크크크큭, 크크크큭’ 하고 드럼 소리처럼 연속적으로 낸다'),
                          Text(
                              '생태 :번식은 2~5월에 걸쳐 이루어지며, 번식 시기부터 월동 전까지는 산이나 계곡으로 이동하지 않고 평지의 습지에 계속 출현하는 습성이 있다. 산개구리와 함께 물이 고인 농지에 산란하거나, 계류 주변의 물 흐름이 거의 없는 웅덩이에 다수의 알로 구성된 알 덩어리를 낳으며, 그 크기는 산개구리에 비해 대단히 작다. 알의 수는 400~500개이다. 올챙이는 약 30mm까지 성장하고 4월 이후에 변태하여 상륙한다.')
                        ]),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'))
                      ],
                    ),
                  ),
                  child: Text(
                    buttonText3,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // child: const Text("두꺼비"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath4,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onLongPress: () async {
                debugPrint(widget.forg);
                if (widget.forg == '금개구리') {
                  setState(() {
                    // Image.asset(imagePath = "images/chungF.png");
                    imagePath4 = "images/goldF.png";
                    buttonText4 = "자세히보기";
                  });
                  if (_prefs != null) {
                    await _prefs!.setString('selectedFrog', '금개구리');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('다른 개구리 카드를 선택해주세요!')));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 10, 20),
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('금개구리'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(
                                '금개구리 특징 :몸길이는 3.5~6cm이다. 등면은 녹색, 갈색 등으로 주변 환경에 따라 다양하다. 눈 뒤에서부터 등면 양쪽에 갈색, 금색의 뚜렷한 융기선 2줄이 있다. 금색의 융기선 사이에 크고 작은 돌기들이 불규칙하게 산재해 있다. 배면은 대부분 황색 또는 금색이다. 수컷은 턱 아래에는 2개의 울음주머니가 있는데 다른 개구리들과 비교해 크기가 무척 작다. 암컷이 수컷보다 몸집이 2~3배 더 크다. 4월이면 동면에서 깨어나 5월부터 7월까지 서식했던 장소에서 그대로 번식한다'),
                            Text(
                                '금개구리 서식지 :같은 속인 참개구리와 비슷한 생태를 보이며 서식지도 곧잘 겹치기 때문에 경쟁관계에 놓여 있다. 한 서식지에서 잘 떠나지 않기 때문에 서식지 파괴에 상당히 취약하다.'),
                            Text('금개구리는 울음 주머니가 없다'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'))
                      ],
                    ),
                  ),
                  child: Text(
                    buttonText4,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath5,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onLongPress: () {
                if (widget.forg == '') {}
                setState(() {
                  buttonText5 = "  꽝입니다";
                });
                if (widget.forg != "") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('다른카드를 선택하세요!')));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 90, 10, 0),
                child: Text(
                  buttonText5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imagePath6,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onLongPress: () async {
                debugPrint(widget.forg);
                if (widget.forg == '참개구리') {
                  setState(() {
                    imagePath6 = "images/chamF.png";
                    buttonText6 = "자세히보기";
                  });
                  if (_prefs != null) {
                    await _prefs!.setString('selectedFrog', '참개구리');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('다른 개구리 카드를 선택해주세요!')));
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 10, 20),
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('참개구리'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text(
                                '참개구리 특징 :산란기는 4~7월이다. 턱 아래쪽에 울음주머니가 있는 청개구리나 황소개구리와는 달리, 산개구리처럼 양 쪽 볼에 울음주머니 한 쌍이 있다. 개구리 왕눈이에 나오는 투투를 생각하면 이해하기 쉬운데, 실제로 투투가 참개구리를 모티브로 해서 만들어진 캐릭터이다.'),
                            Text(
                                '참개구리 울음 소리 :울음소리는 언뜻 들으면 끄르르륵 끄르르륵 하고 들리는데, 시골에서는 청개구리 다음으로 시끄럽게 운다'),
                            Text('참개구리 서식지 : 자신이 태어난 곳 근처의 습지'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'))
                      ],
                    ),
                  ),
                  child: Text(
                    buttonText6,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
