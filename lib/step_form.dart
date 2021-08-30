import 'package:flutter/cupertino.dart';
import './page_indicator.dart';
import 'package:flutter/material.dart';
import './page_body.dart';

class StepForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm>{
  
  int _page = 0;

  final _stepFormController = PageController();

  List _pagesList= [
    pageBody('https://www.careercontessa.com/uploadedImages/Learn/softskills1.jpg',
    'Communication',
    'Effective communication skills will be helpful through the interview process and in your career overall. The ability to communicate involves knowing how you should speak to others in different situations or settings. For example, when working with a team on a project, you may need to communicate when you believe an idea or process is ineffective. Finding a way to tactfully and skillfully disagree with others on the job without creating conflict is an important skill that employers value.'),
    pageBody('https://www.thebalancecareers.com/thmb/_9l1_rB6ymIkTZBmh9-eHfx6kOk=/3000x2000/filters:no_upscale():max_bytes(150000):strip_icc()/problem-solving-skills-with-examples-2063764_Final-5c532ffbc9e77c000102b65a.png',
    'Problem-solving',
    'Employers highly value people who can resolve issues quickly and effectively. That may involve calling on industry knowledge to fix an issue immediately as it occurs, or taking time to research and consult with colleagues to find a scalable, long-term solution.'),
    pageBody('http://rockcontent.com/wp-content/uploads/2021/02/visually-creative-thinking-skills.png',
    'Creativity',
    'Creativity is a broad ability incorporating many different skill sets including other soft skills and technical skills. Employees with creativity can find new ways to perform tasks, improve processes or even develop new and exciting avenues for the business to explore. Creativity can be used in any role at any level.'),
    ];

  void _changeStep(bool nextPage){
    if(_page < 2 && nextPage){
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    else if(_page >0 && !nextPage){
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Soft skills Page'),
      ),
      body: PageView.builder(
        controller: _stepFormController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return _pagesList[index];
        }
        ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: () => _changeStep(false), child: Text("Aterior"),),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(onPressed: () => _changeStep(true), child: Text("Próximo"),),
      ],
      ),
    );
  }

  
}