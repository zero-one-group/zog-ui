import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class IconsTwoToneExample extends StatelessWidget {
  const IconsTwoToneExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero TwoToneIcon Example'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 50),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth ~/ 80,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: _iconsData.length,
          itemBuilder: (context, index) {
            final item = _iconsData[index].entries.first;
            return Container(
              decoration: BoxDecoration(color: Colors.amber.shade50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item.value,
                  const SizedBox(height: 4),
                  Text(
                    item.key,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

final _iconsData = [
  {'upCircle': const ZeroTwoToneIcons.upCircle(size: 32, color: Colors.blue)},
  {'like': const ZeroTwoToneIcons.like(size: 32, color: Colors.blue)},
  {
    'pauseCircle':
        const ZeroTwoToneIcons.pauseCircle(size: 32, color: Colors.blue)
  },
  {
    'checkSquare':
        const ZeroTwoToneIcons.checkSquare(size: 32, color: Colors.blue)
  },
  {'switcher': const ZeroTwoToneIcons.switcher(size: 32, color: Colors.blue)},
  {
    'moneyCollect':
        const ZeroTwoToneIcons.moneyCollect(size: 32, color: Colors.blue)
  },
  {'bulb': const ZeroTwoToneIcons.bulb(size: 32, color: Colors.blue)},
  {
    'fileUnknown':
        const ZeroTwoToneIcons.fileUnknown(size: 32, color: Colors.blue)
  },
  {'appstore': const ZeroTwoToneIcons.appstore(size: 32, color: Colors.blue)},
  {'fileExcel': const ZeroTwoToneIcons.fileExcel(size: 32, color: Colors.blue)},
  {'sound': const ZeroTwoToneIcons.sound(size: 32, color: Colors.blue)},
  {
    'leftCircle':
        const ZeroTwoToneIcons.leftCircle(size: 32, color: Colors.blue)
  },
  {
    'playCircle':
        const ZeroTwoToneIcons.playCircle(size: 32, color: Colors.blue)
  },
  {'fileZip': const ZeroTwoToneIcons.fileZip(size: 32, color: Colors.blue)},
  {'hourglass': const ZeroTwoToneIcons.hourglass(size: 32, color: Colors.blue)},
  {'highlight': const ZeroTwoToneIcons.highlight(size: 32, color: Colors.blue)},
  {
    'reconciliation':
        const ZeroTwoToneIcons.reconciliation(size: 32, color: Colors.blue)
  },
  {'dollar': const ZeroTwoToneIcons.dollar(size: 32, color: Colors.blue)},
  {'home': const ZeroTwoToneIcons.home(size: 32, color: Colors.blue)},
  {
    'poundCircle':
        const ZeroTwoToneIcons.poundCircle(size: 32, color: Colors.blue)
  },
  {'shop': const ZeroTwoToneIcons.shop(size: 32, color: Colors.blue)},
  {'copyright': const ZeroTwoToneIcons.copyright(size: 32, color: Colors.blue)},
  {'alert': const ZeroTwoToneIcons.alert(size: 32, color: Colors.blue)},
  {'sliders': const ZeroTwoToneIcons.sliders(size: 32, color: Colors.blue)},
  {
    'dollarCircle':
        const ZeroTwoToneIcons.dollarCircle(size: 32, color: Colors.blue)
  },
  {'shopping': const ZeroTwoToneIcons.shopping(size: 32, color: Colors.blue)},
  {'fileWord': const ZeroTwoToneIcons.fileWord(size: 32, color: Colors.blue)},
  {
    'funnelPlot':
        const ZeroTwoToneIcons.funnelPlot(size: 32, color: Colors.blue)
  },
  {'usb': const ZeroTwoToneIcons.usb(size: 32, color: Colors.blue)},
  {
    'euroCircle':
        const ZeroTwoToneIcons.euroCircle(size: 32, color: Colors.blue)
  },
  {'tag': const ZeroTwoToneIcons.tag(size: 32, color: Colors.blue)},
  {'upSquare': const ZeroTwoToneIcons.upSquare(size: 32, color: Colors.blue)},
  {
    'downSquare':
        const ZeroTwoToneIcons.downSquare(size: 32, color: Colors.blue)
  },
  {'fileAdd': const ZeroTwoToneIcons.fileAdd(size: 32, color: Colors.blue)},
  {
    'plusSquare':
        const ZeroTwoToneIcons.plusSquare(size: 32, color: Colors.blue)
  },
  {'database': const ZeroTwoToneIcons.database(size: 32, color: Colors.blue)},
  {'file': const ZeroTwoToneIcons.file(size: 32, color: Colors.blue)},
  {
    'accountBook':
        const ZeroTwoToneIcons.accountBook(size: 32, color: Colors.blue)
  },
  {'control': const ZeroTwoToneIcons.control(size: 32, color: Colors.blue)},
  {
    'redEnvelope':
        const ZeroTwoToneIcons.redEnvelope(size: 32, color: Colors.blue)
  },
  {'boxPlot': const ZeroTwoToneIcons.boxPlot(size: 32, color: Colors.blue)},
  {'fileText': const ZeroTwoToneIcons.fileText(size: 32, color: Colors.blue)},
  {
    'folderOpen':
        const ZeroTwoToneIcons.folderOpen(size: 32, color: Colors.blue)
  },
  {'build': const ZeroTwoToneIcons.build(size: 32, color: Colors.blue)},
  {
    'questionCircle':
        const ZeroTwoToneIcons.questionCircle(size: 32, color: Colors.blue)
  },
  {'lock': const ZeroTwoToneIcons.lock(size: 32, color: Colors.blue)},
  {'fire': const ZeroTwoToneIcons.fire(size: 32, color: Colors.blue)},
  {'dislike': const ZeroTwoToneIcons.dislike(size: 32, color: Colors.blue)},
  {'euro': const ZeroTwoToneIcons.euro(size: 32, color: Colors.blue)},
  {'idcard': const ZeroTwoToneIcons.idcard(size: 32, color: Colors.blue)},
  {'meh': const ZeroTwoToneIcons.meh(size: 32, color: Colors.blue)},
  {'ci': const ZeroTwoToneIcons.ci(size: 32, color: Colors.blue)},
  {'diff': const ZeroTwoToneIcons.diff(size: 32, color: Colors.blue)},
  {
    'minusSquare':
        const ZeroTwoToneIcons.minusSquare(size: 32, color: Colors.blue)
  },
  {
    'closeCircle':
        const ZeroTwoToneIcons.closeCircle(size: 32, color: Colors.blue)
  },
  {'mail': const ZeroTwoToneIcons.mail(size: 32, color: Colors.blue)},
  {'book': const ZeroTwoToneIcons.book(size: 32, color: Colors.blue)},
  {'wallet': const ZeroTwoToneIcons.wallet(size: 32, color: Colors.blue)},
  {'fileImage': const ZeroTwoToneIcons.fileImage(size: 32, color: Colors.blue)},
  {'bell': const ZeroTwoToneIcons.bell(size: 32, color: Colors.blue)},
  {'dashboard': const ZeroTwoToneIcons.dashboard(size: 32, color: Colors.blue)},
  {'code': const ZeroTwoToneIcons.code(size: 32, color: Colors.blue)},
  {'carryOut': const ZeroTwoToneIcons.carryOut(size: 32, color: Colors.blue)},
  {'flag': const ZeroTwoToneIcons.flag(size: 32, color: Colors.blue)},
  {'snippets': const ZeroTwoToneIcons.snippets(size: 32, color: Colors.blue)},
  {'stop': const ZeroTwoToneIcons.stop(size: 32, color: Colors.blue)},
  {
    'rightCircle':
        const ZeroTwoToneIcons.rightCircle(size: 32, color: Colors.blue)
  },
  {'container': const ZeroTwoToneIcons.container(size: 32, color: Colors.blue)},
  {'frown': const ZeroTwoToneIcons.frown(size: 32, color: Colors.blue)},
  {'tool': const ZeroTwoToneIcons.tool(size: 32, color: Colors.blue)},
  {
    'safetyCertificate':
        const ZeroTwoToneIcons.safetyCertificate(size: 32, color: Colors.blue)
  },
  {'trophy': const ZeroTwoToneIcons.trophy(size: 32, color: Colors.blue)},
  {'warning': const ZeroTwoToneIcons.warning(size: 32, color: Colors.blue)},
  {'pieChart': const ZeroTwoToneIcons.pieChart(size: 32, color: Colors.blue)},
  {
    'securityScan':
        const ZeroTwoToneIcons.securityScan(size: 32, color: Colors.blue)
  },
  {
    'infoCircle':
        const ZeroTwoToneIcons.infoCircle(size: 32, color: Colors.blue)
  },
  {
    'eyeInvisible':
        const ZeroTwoToneIcons.eyeInvisible(size: 32, color: Colors.blue)
  },
  {
    'leftSquare':
        const ZeroTwoToneIcons.leftSquare(size: 32, color: Colors.blue)
  },
  {'copy': const ZeroTwoToneIcons.copy(size: 32, color: Colors.blue)},
  {'gold': const ZeroTwoToneIcons.gold(size: 32, color: Colors.blue)},
  {'fund': const ZeroTwoToneIcons.fund(size: 32, color: Colors.blue)},
  {
    'playSquare':
        const ZeroTwoToneIcons.playSquare(size: 32, color: Colors.blue)
  },
  {
    'fileExclamation':
        const ZeroTwoToneIcons.fileExclamation(size: 32, color: Colors.blue)
  },
  {
    'environment':
        const ZeroTwoToneIcons.environment(size: 32, color: Colors.blue)
  },
  {
    'checkCircle':
        const ZeroTwoToneIcons.checkCircle(size: 32, color: Colors.blue)
  },
  {'html5': const ZeroTwoToneIcons.html5(size: 32, color: Colors.blue)},
  {'save': const ZeroTwoToneIcons.save(size: 32, color: Colors.blue)},
  {'smile': const ZeroTwoToneIcons.smile(size: 32, color: Colors.blue)},
  {'setting': const ZeroTwoToneIcons.setting(size: 32, color: Colors.blue)},
  {'message': const ZeroTwoToneIcons.message(size: 32, color: Colors.blue)},
  {
    'copyrightCircle':
        const ZeroTwoToneIcons.copyrightCircle(size: 32, color: Colors.blue)
  },
  {'crown': const ZeroTwoToneIcons.crown(size: 32, color: Colors.blue)},
  {
    'notification':
        const ZeroTwoToneIcons.notification(size: 32, color: Colors.blue)
  },
  {'picture': const ZeroTwoToneIcons.picture(size: 32, color: Colors.blue)},
  {'camera': const ZeroTwoToneIcons.camera(size: 32, color: Colors.blue)},
  {'printer': const ZeroTwoToneIcons.printer(size: 32, color: Colors.blue)},
  {
    'exclamationCircle':
        const ZeroTwoToneIcons.exclamationCircle(size: 32, color: Colors.blue)
  },
  {
    'downCircle':
        const ZeroTwoToneIcons.downCircle(size: 32, color: Colors.blue)
  },
  {'rest': const ZeroTwoToneIcons.rest(size: 32, color: Colors.blue)},
  {'contacts': const ZeroTwoToneIcons.contacts(size: 32, color: Colors.blue)},
  {'star': const ZeroTwoToneIcons.star(size: 32, color: Colors.blue)},
  {
    'trademarkCircle':
        const ZeroTwoToneIcons.trademarkCircle(size: 32, color: Colors.blue)
  },
  {
    'experiment':
        const ZeroTwoToneIcons.experiment(size: 32, color: Colors.blue)
  },
  {'edit': const ZeroTwoToneIcons.edit(size: 32, color: Colors.blue)},
  {'api': const ZeroTwoToneIcons.api(size: 32, color: Colors.blue)},
  {'bug': const ZeroTwoToneIcons.bug(size: 32, color: Colors.blue)},
  {'unlock': const ZeroTwoToneIcons.unlock(size: 32, color: Colors.blue)},
  {'compass': const ZeroTwoToneIcons.compass(size: 32, color: Colors.blue)},
  {
    'plusCircle':
        const ZeroTwoToneIcons.plusCircle(size: 32, color: Colors.blue)
  },
  {'bank': const ZeroTwoToneIcons.bank(size: 32, color: Colors.blue)},
  {
    'creditCard':
        const ZeroTwoToneIcons.creditCard(size: 32, color: Colors.blue)
  },
  {
    'fileMarkdown':
        const ZeroTwoToneIcons.fileMarkdown(size: 32, color: Colors.blue)
  },
  {'audio': const ZeroTwoToneIcons.audio(size: 32, color: Colors.blue)},
  {'delete': const ZeroTwoToneIcons.delete(size: 32, color: Colors.blue)},
  {'skin': const ZeroTwoToneIcons.skin(size: 32, color: Colors.blue)},
  {'phone': const ZeroTwoToneIcons.phone(size: 32, color: Colors.blue)},
  {'eye': const ZeroTwoToneIcons.eye(size: 32, color: Colors.blue)},
  {'mobile': const ZeroTwoToneIcons.mobile(size: 32, color: Colors.blue)},
  {'insurance': const ZeroTwoToneIcons.insurance(size: 32, color: Colors.blue)},
  {'gift': const ZeroTwoToneIcons.gift(size: 32, color: Colors.blue)},
  {'car': const ZeroTwoToneIcons.car(size: 32, color: Colors.blue)},
  {'ciCircle': const ZeroTwoToneIcons.ciCircle(size: 32, color: Colors.blue)},
  {
    'thunderbolt':
        const ZeroTwoToneIcons.thunderbolt(size: 32, color: Colors.blue)
  },
  {'profile': const ZeroTwoToneIcons.profile(size: 32, color: Colors.blue)},
  {'tags': const ZeroTwoToneIcons.tags(size: 32, color: Colors.blue)},
  {'folderAdd': const ZeroTwoToneIcons.folderAdd(size: 32, color: Colors.blue)},
  {'schedule': const ZeroTwoToneIcons.schedule(size: 32, color: Colors.blue)},
  {'filter': const ZeroTwoToneIcons.filter(size: 32, color: Colors.blue)},
  {'calendar': const ZeroTwoToneIcons.calendar(size: 32, color: Colors.blue)},
  {
    'videoCamera':
        const ZeroTwoToneIcons.videoCamera(size: 32, color: Colors.blue)
  },
  {
    'minusCircle':
        const ZeroTwoToneIcons.minusCircle(size: 32, color: Colors.blue)
  },
  {
    'closeSquare':
        const ZeroTwoToneIcons.closeSquare(size: 32, color: Colors.blue)
  },
  {'cloud': const ZeroTwoToneIcons.cloud(size: 32, color: Colors.blue)},
  {
    'interaction':
        const ZeroTwoToneIcons.interaction(size: 32, color: Colors.blue)
  },
  {
    'propertySafety':
        const ZeroTwoToneIcons.propertySafety(size: 32, color: Colors.blue)
  },
  {
    'rightSquare':
        const ZeroTwoToneIcons.rightSquare(size: 32, color: Colors.blue)
  },
  {'rocket': const ZeroTwoToneIcons.rocket(size: 32, color: Colors.blue)},
  {'tablet': const ZeroTwoToneIcons.tablet(size: 32, color: Colors.blue)},
  {'pushpin': const ZeroTwoToneIcons.pushpin(size: 32, color: Colors.blue)},
  {'hdd': const ZeroTwoToneIcons.hdd(size: 32, color: Colors.blue)},
  {
    'calculator':
        const ZeroTwoToneIcons.calculator(size: 32, color: Colors.blue)
  },
  {
    'medicineBox':
        const ZeroTwoToneIcons.medicineBox(size: 32, color: Colors.blue)
  },
  {'project': const ZeroTwoToneIcons.project(size: 32, color: Colors.blue)},
  {'folder': const ZeroTwoToneIcons.folder(size: 32, color: Colors.blue)},
  {'filePpt': const ZeroTwoToneIcons.filePpt(size: 32, color: Colors.blue)},
  {'filePdf': const ZeroTwoToneIcons.filePdf(size: 32, color: Colors.blue)},
  {
    'customerService':
        const ZeroTwoToneIcons.customerService(size: 32, color: Colors.blue)
  },
  {'layout': const ZeroTwoToneIcons.layout(size: 32, color: Colors.blue)},
  {
    'clockCircle':
        const ZeroTwoToneIcons.clockCircle(size: 32, color: Colors.blue)
  },
  {'heart': const ZeroTwoToneIcons.heart(size: 32, color: Colors.blue)},
];
