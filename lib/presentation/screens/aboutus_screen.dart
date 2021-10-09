import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AboutUsScreen extends HookWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset("images/logo.png"),
            Divider(
              thickness: 5,
              color: Colors.blue[100],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: const Text(
                  "من نحن ؟",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                collapsed: const Text(
                  "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: const Text(
                  "لجنة الطب والجراحة هي مؤسسة طلابية مستقلّة, تعمل في الوسط الطلابيّ في جامعة مؤتة تستمد قيمها من قيم الإسلام وتهدف إلى الوصول إلى حالةٍ راقية و متحضّرة والإسهام في بناء كلية الطب والجامعة ونهضتهما والمراكمة على مكتسباتها",
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                theme: const ExpandableThemeData(
                    tapBodyToExpand: true, hasIcon: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: const Text(
                  "قيمنا",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                collapsed: const Text(
                  "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: const Text(
                  """قيم المجتمع المسلم والنهضة *

التطوع *

الشفافية والوضوح *

احترام الخصوم والسعي إلى تقريب وجهات النظر المختلفة *

تعزيز ثقافة التعاون والتشارك والعمل الجماعي *""",
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                theme: const ExpandableThemeData(
                    tapBodyToExpand: true, hasIcon: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: const Text(
                  "رؤيتنا",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                collapsed: const Text(
                  "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: const Text(
                  "تنطلق اللجنة من الوعي بضرورة المساهمة في التجديد الشامل للعمل الطلابي, وضرورة الالتزام بقيم النهضة مع التركيز على دور الطلبة المرجو فيها, ودعم جهود التكاتف بين أبناء الكلية الواحدة والجامعة الواحدة وتمتين التعاضد بينهم, ونشر ثقافة الحوار البّناء والتأكيد على الحق في الاختلاف, والانحياز للفاعلية و الإيجابية التي تصب في المصلحة العامة، متمسكة بالثوابت الأخلاقية التي حث عليها ديننا الإسلامي الحنيف وكل الديانات السماوية, محترمًة بذلكُ قيم المجتمع البّناءة, غير متعارضة معها ولا محاربة لها",
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                theme: const ExpandableThemeData(
                    tapBodyToExpand: true, hasIcon: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: const Text(
                  "رسالتنا",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                collapsed: const Text(
                  "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: const Text(
                  "تتمثل رسالتنا بالتجسيد الفعلي لمبادئ التشارك الطلابي العام، والتزام الإيمان بضرورة انتماء الطالب لكليته وجامعته ووطنه، والتأكيد على دوره الفاعل في البناء والنهوض، والعمل على توعية المجتمع الطلابي بحقوقه المنصوص عليها والمطالبة بها، والانحياز التام لهموم الطلبة والسعي في حلها إيمانا منا بأن الجامعة ما هي إلا مؤسسة من أهم مؤسسات نهضتنا التي نحلم بها ونسعى إليها",
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                theme: const ExpandableThemeData(
                    tapBodyToExpand: true, hasIcon: true),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: const Text(
                  "أهدافنا",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                collapsed: const Text(
                  "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: const Text(
                  '''
                  وإذ تختزل هذه الكلمات رسالة اللجنة بما يكسبها عمقا قيميا، فإن تنزيلها في ساحة العمل الطلابي يتجسد في السعي لتحقيق الغايات التالية

 تأهيل طالب مجتهد ومسؤول، معتز بدينه ووطنه، منتمٍ لمجتمعه، فاعل في محيطه، واعٍ لدوره في الحياة

 الوصول إلى كلية طب فاعلة في المجتمع، مساهمة بإقتدار في إسناد الوطن، وإعداد الكفاءات التي يحتاجها القطاع الصحي

 

 المساهمة في تأسيس ثقافة البحث العلمي، ودوره في الإنطلاق الحضاري.

 

 إرساء فضاء للحوار والحرية والإنفتاح على الآخر.

 

 إيجاد مسارات حقيقية لإستثمار الطاقات الطلابية المبدعة والخلاقة.

 

وتقوم اللجنة برسالتها من خلال المشاركة في المؤسسات الطلابية المختلفة التي توفرها الجامعة، وتستثمر مختلف منافذ الفضاء الإعلامي لإيصال رسالتها وقيمها وتعميمها على الشارع الطلابي والمجتمع المحلي، ومسارات التنمية الثقافية والندوات والمحاضرات وفرص التأهيل القيادي، والتدريب والبحث العلمي، بالإضافة إلى الأنشطة اللامنهجية والأعمال التطوية الأخرى
                  ''',
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                theme: const ExpandableThemeData(
                    tapBodyToExpand: true, hasIcon: true),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
