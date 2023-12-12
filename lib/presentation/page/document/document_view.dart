import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/dialog/dia_logs.dart';
import 'package:itfsd/app/core/common/dialog/dialog_icon_button.dart';
import 'package:itfsd/app/core/common/divider/common.divider.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/app/util/icon_utils.dart';

import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/document/agricultural_guide.dart';
import 'package:itfsd/presentation/page/document/guide_detail_view.dart';

import '../../controllers/document/document_controller.dart';

class DocumentView extends BaseView<DocumentController> {
  const DocumentView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    final List<AgriculturalGuide> guideList = [
      AgriculturalGuide(
        id: 1,
        title: "Hướng dẫn gieo hạt giống",
        content: """
        Bước 1: Chuẩn bị đất và chăm sóc cho đất tốt.
        Bước 2: Gieo hạt giống vào đất nhẹ nhàng.
        Bước 3: Tưới nước nhẹ nhàng và đều đặn.
        Bước 4: Dùng phủ màng chống hạt giống bị bay mất.
        Bước 5: Chờ đợi và chăm sóc cây trồng.
        """,
        imageUrl:
            "https://ducphatvn.com/wp-content/uploads/2019/02/huong-dan-quy-trinh-gieo-giong-cay-trong-chuan-nhat.jpg",
        author: "Nguyễn Văn A",
        publishDate: DateTime(2023, 12, 15),
      ),
      AgriculturalGuide(
        id: 2,
        title: "Bảo vệ cây trồng khỏi sâu bệnh",
        content: """
      Xin lưu ý một số vấn đề như sau:

+ Sử dụng thuốc khi đến ngưỡng: Khác với bệnh hại cây trồng, sâu hại là những đối tượng sinh vật bằng mắt thường có thể nhìn rõ nên ta biết khi chúng xuất hiện trên ruộng đồng, mật độ nhiều hay ít, nông dân có thể đếm được.

Chính vì vậy, nguyên tắc đúng là phải trừ sâu khi đến ngưỡng (là mức sâu ở mật độ đó làm sụt giảm năng suất cây trồng). Không phòng sâu hay cứ nhìn thấy có sâu là phun hoặc khi sâu gây hại xong rồi lại đi phun thuốc quá muộn lúc sâu đẫy sức hay đã vào nhộng.
Ví dụ: Đối với loài sâu tơ gây hại cây họ hoa thập tự thì ngưỡng phun trừ thuốc phải là 20 con/m2 khi cây còn nhỏ. Đối với cây đã lớn, ngưỡng phòng trừ là 30 con/m2.

+ Thời điểm trừ sâu, sâu dễ chết nhất: Đó là lúc sâu non tuổi còn nhỏ (sâu mới nở) nên không có khả năng kháng thuốc. Muốn biết được đúng thời điểm này, việc làm cần thiết là thăm đồng theo dõi bướm. Đa số các loài sâu thì bướm vũ hóa và đẻ trứng 2 - 3 ngày, pha trứng thường kéo dài từ 6 - 10 ngày.

Cần theo dõi bướm vũ hóa tập trung vào những ngày nào để tính toán thời điểm trứng nở thành sâu non tuổi 1. Lúc phun sâu ở giai đoạn này hầu như không nhìn thấy sâu non hoặc nhìn thấy thì rất khó đếm được. Vì vậy, khi điều tra pha bướm cần phải biết được mật độ bướm trung bình có bao nhiêu con/m2. Đồng thời, biết rõ loài bướm sâu này đẻ trung bình được bao nhiêu trứng mỗi con cái, để từ đó ước lượng, dự đoán được lượng sâu non/m2. Muốn làm được điều này bà con cần tham gia đầy đủ các buổi học nghề về trồng trọt ở địa phương tổ chức.

+ Khi hòa thuốc sâu có nên cộng với thứ gì làm sâu chết nhanh? Nhiều nông dân khi đi phun thuốc sâu thường có thói quen và truyền tai nhau cho thêm rượu vào bình thuốc đã hòa để làm sâu chết nhanh. Vì họ cho rằng, sâu bị say rượu nên dễ chết hơn. Hoặc khi phun trừ rệp sáp, nhiều người có thói quen thêm xà phòng vào bình thuốc để lớp sáp trên mình rệp dễ phá vỡ.

 Những thói quen này đều sai khoa học và làm cho hiệu lực của thuốc bị giảm đi. Vì rượu và xà phòng về bản chất đều là các bazơ (có tính kiềm) nên khi phối trộn với các loại thuốc sâu có tính axit thì đều gây ra phản ứng bất lợi (dung dịch kết tủa hoặc bay hơi...).


Vì thế, khi hòa thuốc sâu vào bình để phun không nên trộn 2 thứ dung môi trên. Chỉ sử dụng rượu trong trường hợp hòa thuốc Dipterex để trừ bọ xít. Vì thuốc này rất khó tan trong nước nếu hòa đơn lẻ thuốc. Muốn thuốc tan nhanh hơn nên hòa thuốc vào khoảng 1 lít nước trước rồi đổ khoảng 20 mm rượu trắng vào dung dịch thuốc đã hòa khuấy tan đều rồi đỏ vào bình và cho thêm nước đến mức quy định.

Chú ý:

+ Các loại thuốc trừ rầy rệp hiện nay do các công ty khi SX thuốc đã cho các dung môi có lợi cho việc trừ sâu sẵn vào trong thuốc để diệt sâu hiệu quả hơn. Vì vậy, nông dân không cần phối trộn thêm thứ gì khi pha thuốc.

+ Khác với nhiều loài sâu khác (chỉ pha sâu non mới gây hại cây trồng), các loài rầy, rệp và bọ nhảy thì cả 2 pha (trưởng thành và sâu, rầy non) đều có khả năng gây hại.

Riêng loài bọ nhảy sọc cong vỏ lạc hại rau thập tự thì trưởng thành là những con bọ đen ăn giỗ lá trên cây, dưới đất, sâu non lại cắn phá làm cụt hết rễ rau thậm chí làm cây chết héo vì đứt hết rễ. Cho nên, khi phun thuốc trừ bọ nhảy nông dân cần phải cùng lúc diệt cả 2 pha này (phun thuốc trên thân lá đồng thời phun đẫm cả gốc cây rau).

+ Để phát huy hiệu lực của thuốc và làm sâu không kháng thuốc (nhờn thuốc), nông dân cần phun vào chiều mát (ngày có nắng) hoặc vào lúc tạnh ráo (ngày có mưa). Đồng thời, cần hòa thuốc đúng theo nhãn mác hướng dẫn ghi trên bao bì. Không nên tăng nồng độ, liều lượng sẽ làm cho thuốc dần dần mất hiệu lực (sâu kháng thuốc).

+ Khác với thuốc trừ bệnh, thuốc trừ sâu khi phun cho cây trồng có thể phối trộn được với phân bón lá có chứa đạm nhằm một mặt diệt sâu, mặt khác, bổ sung dinh dưỡng cho cây nhanh hồi phục sau khi bị sâu gây hại...

+ Một số loài sâu có tính kháng thuốc cao (sâu tơ, bọ nhảy, rầy, rệp, nhện đỏ...) cần phun kép 2 lần cách nhau 3 - 4 ngày mới có hiệu quả trừ sâu. Riêng loài bọ nhảy có khả năng bay nhảy nhanh thì khi phun người phun cần phải đi theo đường vòng xuyến xoáy chôn ốc để đồn bọ nhảy vào giữa sẽ diệt được nhiều hơn...

+ Một số loài sâu thì pha gây hại lại nằm sâu trong thân, lá cây (sâu đục thân, dòi đục lá, sâu đục quả...) cần lựa chọn các loại thuốc trừ sâu có tính nội hấp và lưu dẫn mới nhằm diệt được sâu triệt để.

+ Không nên phun thuốc trừ sâu khi đã phát hiện ra cây bị sâu hại nhưng quá muộn. Ví dụ, thấy dòi đục lá cà chua thành các đường ngoằn nghèo nhưng quan sát trên lá cây không còn dòi nữa thì coi như đã muộn không nên phun nữa.
        """,
        imageUrl:
            "https://www.camau.gov.vn/wps/wcm/connect/c9e9b90f-cc2b-4d95-929d-779f3950f5ec/1/gyu.jpg?MOD=AJPERES&CVID=",
        author: "Trần Thị B",
        publishDate: DateTime(2023, 12, 16),
      ),
      AgriculturalGuide(
        id: 3,
        title: "Kỹ thuật tưới nước hiệu quả",
        content: """
   Đây là phương pháp tưới bằng cách phun nước từ dưới mặt nước lên tán cây qua hệ thống máy bơm, ống dẫn nước với các vòi phun cố định, tự động xoay được với góc 360o , được đặt cao khỏi mặt đất 0,5-1,0m, thường áp dụng tưới cho cây con trong vườn ươm dưới dạng phun sương hay phun mù.
Tưới phun cũng có thể dưới hình thức vòi phun hạt to di động cầm tay dùng để tưới cây ăn quả vào những ngày nắng nóng (phun vào 16-18 giờ chiều) để tăng ẩm độ không khí, giảm độ nóng cho quả, cho cây, chống hiện tượng rụng quả do thời tiết khắc nghiệt.

Phương pháp này có ưu điểm là khắc phục được hiện tượng thời tiết không thuận lợi (nắng nóng, độ ẩm không khí thấp) đảm bảo năng suất, chất lượng quả và đảm bảo yêu cầu kỹ thuật cao trong việc nhân giống cây con (ươm, giâm cây giống). Song lại có nhược điểm vốn đầu tư ban đầu tương đối lớn, nơi có điều kiện kinh tế mới áp dụng được. Nếu tưới nhiều bằng vòi phun cầm tay di động, hạt nước to khiến mặt đất cũng bị gí chặt, phá vỡ
kết cấu mặt đất, chất dinh dưỡng bị rữa trôi theo dòng nước chảy trên mặt đất.

2. Tưới ngầm
Tưới ngầm là phương pháp tưới nước cho cây qua hệ thống thiết bị máy bơm kèm theo hệ thống các ống dẫn nước đặc biệt nằm dưới lòng đất hoặc có sự chênh lệch mực nước của nguồn cung cấp nước.

tuosi ngầm
Tưới ngầm
Tưới ngầm tiết kiệm nước. Đất không bị gí chặt, giữ nguyên hiện trạng kết cấu đất, đất không bị bào mòn, phân bón không bị rửa trôi. Chi phí đầu tư ban đầu cho phương pháp này khá lớn, chỉ áp dụng được đối với các loại đất có độ xốp cần thiết cho nước thấm qua dễ dàng.

3. Tưới ngập
hinh 6b
Các đồng ruộng ngập nước cũng là một phương pháp tưới ngập
Tưới ngập là phương pháp cho nước vào vườn cây một lớp nước nhất định, trong một thời gian xác định để cung cấp nước cho cây. Phương pháp này kết hợp được việc tưới nước với tiêu diệt một số loài sâu hại cư trú
trong lòng đất (dế cắn rễ cây, nhộng, các loài ruồi, sâu đục hạt quả xoài và quả các loại cây khác).

Phương pháp tưới này tốn nhiều nước, chỉ áp dụng được với nơi có địa hình tương đối bằng phẳng, thoát nước tốt. Đất bị gí chặt, dinh dưỡng bị rửa trôi theo dòng nước, kết cấu đất bị phá vỡ.

4. Tưới rãnh
tưới rãnh
Thi công hệ thống tưới rãnh
Là phương pháp tưới nước để nước chảy theo các rãnh được thiết kế giữa các hàng cây. Nước được thấm dần vào đất và cung cấp cho cây trồng. Cách tưới nước này tiết kiệm và chủ động được nước tưới cho vườn cây,
lớp đất vẫn tơi xốp, không bị gí chặt, kết cấu đất vẫn giữ vững, đất không bị bào mòn, chất dinh dưỡng không bị rửa trôi. Đây là phương pháp tưới thông dụng thường được bà con tưới cho nhiều vườn cây ăn quả trong cả nước. Nhưng chỉ áp dụng được với nơi có địa hình tương đối bằng phẳng (độ dốc <50).

Phương pháp tưới này cũng có một số hạn chế như: lãng phí một phần nước ở cuối rãnh tưới; gặp khó khăn trong việc vận chuyển công cụ sản xuất qua rãnh; phải chi phí khá lớn nhân công và thời gian cho việc cải tạo các rãnh nước.

5. Tưới nhỏ giọt
32887355 1621489211232110 8554420628415840256 n
Cà chua được trồng theo phương pháp tưới nhỏ giọt trên nền giá thể
Đây là phương pháp tưới hiện đại, thường được áp dụng đối với những vườn cây ăn trái đặc sản có hiệu quả kinh tế cao ở những vùng thiếu nước tưới. Cách tưới này tiết kiệm lượng nước tối đa. Đất không bị gí chặt, giữ nguyên hiện trạng kết cấu đất, đất không bị bào mòn, phân bón không bị rửa trôi. Nhưng đây là phương pháp yêu cầu đầu tư lớn nên còn tùy thuộc vào nguồn tài chính mới có khả năng dụng trong sản xuất đại trà.
        """,
        imageUrl:
            "https://hachi.com.vn/wp-content/uploads/2018/01/crop3-1024x683.png",
        author: "Lê Văn C",
        publishDate: DateTime(2023, 12, 17),
      ),
      AgriculturalGuide(
        id: 4,
        title: "Phân loại đất và cách cải tạo",
        content: """
Như chúng ta đã biết, hầu hết tất cả các loại cây trồng đều sinh trưởng và phát triển tốt nhất trên các loại đất màu mỡ, giàu dinh dưỡng. Tuy nhiên, không phải đất trồng ở đâu cũng có thể đáp ứng được điều kiện quan trọng này. Bằng chứng cho thấy là các vùng miền nước ta có rất nhiều loại đất trồng có kết cấu đất và thành phần khác nhau. Dưới đây là những thông tin giúp bạn hiểu rõ hơn về các loại đất trồng cây và cách cải tạo mang đến hiệu quả tốt nhất.

Các loại đất trồng cây ở nước ta có gì đặc biệt?
Các loại đất trồng cây ở nước ta có gì đặc biệt?
Đất pha cát
Ở nhiều vùng đồi núi ở nước ta thường bắt gặp loại đất pha cát, đặc điểm nhận biết loại đất này như sau:

Đất thô, ngoài đất có pha lẫn các hạt cát rời rạc khi sờ thấy sạn tay và không có độ kết dính cao
Tùy mức độ pha cát ít hay nhiều mà sẽ thấy sự chênh lệnh giữa lượng cát và đất
Thành phần cơ giới nhiều nhất là cát chiếm đến 80%, khoảng 20% còn lại là mùn và sét
Ưu, nhược điểm của đất pha cát cho trồng trọt:
Thành phần cát nhiều nên thấm hút nước nhanh
Không có độ kết dính đổi lại độ thoáng khí cao
Dễ cày bừa, làm tơi xốp đất
Độ kết dính kém dẫn đến khả năng giữ nước và giữ dinh dưỡng kém, đất ít màu mỡ, thoát nước nhanh nên dễ xảy ra tình trạng khô hạn, thiếu nước cho cây trồng phát triển
Vi sinh vật có lợi không có môi trường sinh trưởng và hoạt động dẫn đến đất kém dinh dưỡng, nghèo mùn cho phân giải các chất hữu cơ quá nhanh
Biện pháp cải tạo đất pha cát:
Cày bữa, canh tác ở tầng đất sâu để cải thiện hàm lượng sét
Nên bón lót trước khi trồng cây để cải thiện dinh dưỡng cho đất, khi bón thúc thì vùi sâu và lấp đất kỹ
Có thể bón thêm bùn ao và tưới nước phù sa
Đất pha cát cần được cải tạo để cải thiện mức độ dinh dưỡng
Đất pha cát cần được cải tạo để cải thiện mức độ dinh dưỡng
Đất sét
Ngược lại với đất pha cát, nhiều vùng miền nước ta còn gặp phải tình trạng đất sét nhiều gây trở ngại cho trồng trọt.

ĐẤT SẠCH ĐÓNG BAO TROPICAL PREMIUM
SẢN PHẨM NỔI BẬT
Đa dạng & chất lượng. Hãy trồng nhiều cây hơn, ngay hôm nay, để bảo vệ môi trường quanh ta.
Đặc điểm của đất sét rất dễ phân biệt:
Đất có độ kết dính rất cao, khi tưới nước nhiều đất dẻo dính chặt vào nhau, khi khô hạn thì đất vón thành các cục rất cứng, khó canh tác
Thành phần cơ giới chủ yếu là sét chiếm đến 50- 80%, còn lại là cát, mùn
Ưu, nhược điểm trong trồng trọt:
Độ kết dính cao nên giữ nước lâu, duy trì được nhiệt độ và độ ẩm ổn định cho cây trồng
Tương tự, độ kết dính của đất sét cũng giữ được dinh dưỡng, phân cho cây trồng, khó bị rửa trôi dinh dưỡng nhưng kết cấu đất dính quá chặt nên cây cũng rất khó hấp thu được các chất dinh dưỡng thiết yếu này
Các chất hữu cơ phân giải chậm nên đất sét giàu dinh dưỡng hơn đất cát
Không có hệ thống thoát nước cây rất dễ bị ngập úng, thối và chết rễ
Cày bừa, canh tác rất tốn công sức, đất không có độ thoáng khí
Vào mùa khô hạn đất sét dễ xảy ra tình trạng nứt nẻ trên diện rộng, nghiêm trọng hơn sẽ dẫn đến đứt rễ cây
Biện pháp cải tạo:
Nên bón cát, thêm đất màu hay tưới nước phù sa thô để hỗ trợ thay đổi kết cấu đất
Nên bón vôi, phân hữu cơ như phân chuồng hoai mục hay phân xanh để cải tạo dinh dưỡng đất
Tránh trồng các loại cây trồng lấy củ trên đất sét cho năng suất và chất lượng kém
Đất sét cần được cải tạo để giảm đi độ kết dính và thoát nước tốt hơn
Đất sét cần được cải tạo để giảm đi độ kết dính và thoát nước tốt hơn
Đất thịt
So với 2 loại đất kể trên thì đất thịt được xem là loại đất trồng lý tưởng nhất cho hầu hết các loại cây trồng với các đặc điểm:

Còn được gọi là đất mùn
Thành phần cơ giới có sự cân bằng với 30 – 50% mùn, cát dưới 50%, sét từ 7 – 27%
Tùy vào thành phần mùn mà người ta phân chia đất thịt nhẹ và đất thịt trung bình
Ưu điểm:
Thích hợp với hầu hết các loại cây trồng
Thành phần hạt cát lớn giúp làm tăng độ thoáng khí cho đất trồng đồng thời làm tăng khả năng thoát nước
Hạt sét nhỏ đóng vai trò kết dính các thành phần có trong đất trồng làm tăng khả năng giữ nước, duy trì độ ẩm và giữ dinh dưỡng cho đất màu mỡ
Mùn là thành phần trung gian giúp cát và sét phối trộn với nhau dễ dàng, giúp đất thêm giàu dinh dưỡng
Mục đích cuối cùng của việc cải tạo đất pha cát và đất sét chính là giúp chúng có các tính chất của đất thịt, cung cấp môi trường lý tưởng nhất cho mọi loại cây trồng phát triển.

Đất thịt giàu dinh dưỡng là loại đất thích hợp nhất cho các loại cây trồng
Đất thịt giàu dinh dưỡng là loại đất thích hợp nhất cho các loại cây trồng
Như vậy, có thể thấy ở nước ta có nhiều loại đất trồng với thành phần cơ giới và tính chất khác nhau, đôi khi không thích hợp cho trồng trọt. Vì vậy, điều mà bạn cần làm chính là nhận biết đúng loại đất và áp dụng hợp lý các biện pháp cải tạo. Chúc bạn sớm có những vườn cây hoàn hảo cho năng suất và chất lượng cao nhất!
        """,
        imageUrl:
            "https://giathe.vn/wp-content/uploads/2020/12/cac-loai-dat-trong-cay-01.jpg",
        author: "Phạm Thị D",
        publishDate: DateTime(2023, 12, 18),
      ),
      AgriculturalGuide(
        id: 5,
        title: "Cách nhận biết và chống sâu hại",
        content: """
        Bước 1: Học biết về loại sâu hại thường gặp trong vùng.
        Bước 2: Theo dõi cây trồng thường xuyên để phát hiện sớm.
        Bước 3: Sử dụng thủ phạm tự nhiên để kiểm soát sâu hại.
        Bước 4: Áp dụng phương pháp kiểm soát hóa học nếu cần.
        Bước 5: Tổ chức phun thuốc định kỳ để ngăn chặn sự phát triển của sâu hại.
        """,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp-pIaLpehhXqiyq2nKz2YYXNKb_9h5M0-6dpNE0j49T6YEvl80J2SPxAM3ZLrCj4M5Uw&usqp=CAU",
        author: "Nguyễn Văn E",
        publishDate: DateTime(2023, 12, 19),
      ),
      AgriculturalGuide(
        id: 6,
        title: "Kỹ thuật thu hoạch và bảo quản",
        content: """
        Bước 1: Xác định thời điểm thu hoạch phù hợp với từng loại cây.
        Bước 2: Sử dụng công cụ thu hoạch đúng cách để tránh làm hỏng sản phẩm.
        Bước 3: Kiểm tra sản phẩm sau khi thu hoạch để loại bỏ sản phẩm không đạt chất lượng.
        Bước 4: Sử dụng phương pháp bảo quản phù hợp với từng loại cây trồng.
        Bước 5: Thực hiện kiểm tra định kỳ để đảm bảo sản phẩm được bảo quản đúng cách.
        """,
        imageUrl:
            "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGBxQUExYUFBQYGBYZGhkaGRoaGRkaIBkfHBoaHB8cHSAcHysiGhwoHxocIzQjKCwuMTExGiE3PDcwOyswMS4BCwsLDw4PHRERHTIoIig5MjI5MjA5MDAyLjIwOTAwMjIyMDAwMDAyMTAwMDAwMDAwMDA5MDAwMDAwMDAwMDAwMP/AABEIAKgBLAMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQIDBgEAB//EAD4QAAIBAgQEBAQEBgAFBAMAAAECEQADBBIhMQVBUWETInGBBjKRoUKxwdEUI1Jy4fAVM2KC8QcWktIkosL/xAAZAQADAQEBAAAAAAAAAAAAAAABAgMABAX/xAAvEQACAgICAQMDAwMEAwAAAAAAAQIRAyESMUEEIlETYXEUkbEywfCB0eHxI0Kh/9oADAMBAAIRAxEAPwBOt6KsXE13+EJ5Vz+AauWTR5jI3cZFcbEyNK83CnNE2OEMKRShF9m0K8ShNDKkVpW4QY2pdc4awOooPJB+Q2KrjRVtm7TlOA5xtV+H+GD0pfqQRrQjzGrUatEnw6OlT/4AKP6mALM6oqNwGtVa4AByq0cDWg/VwNZjVBqwI3StmvBFFdHCEpP1kfg1sxvgMeVX4XDkaxWu/wCGpXDgkFK/V2ugWZwZm0iurwwk1pLOGQcqsyrNKs8l0CzJ3uGPOgqVnhj9K2GROlcd0A2rfrJdDGKxHBbhNct/D7zWrOJE7VYl4dKP6qdA5MQ2+COBXE+HmmTWhuY8CoXOJgCp/q5msVJwQiuPwqijxmTtVdzHk1v1EvILIjhIIqVrgy86lbxhrj4w8qH12azj8AU0O3wwtErjWqS41qVZ5/JrKLXAVFEnhK7Vzx2rvjnrQeefyCzi8GSvNw5BXBfNRNyTSPPL5DZ1cDb7Vy/grccq8dKouXqSWaZik8PSdq5/Bp0qfj1LNR+pJ+QWxqOHrU1wI6UW91VEkgCqbfEEYwsnvEfnTp5JdDaR5MKOlWjDDpXlxAJgURdRlElSAdjuPqKT3PYySKDhx0pdj7CjWKYtfoPHsGEUcbaexXQNhcUoo7+NWKSJgSaLsYQjc1WU4ITYwS/NWqwoBvLXDiai2n0NYwe8BVIxFBNdJqAeh0ZsZPiaobFUIbneuZx1oNmsL8Y1BmqtLqxUd6yejaLPEI51B73eoE1F9aybFLf4vvVVzFGvLZFeYCiqCVeP2qxMQautYUESYUROu59BXrdjSaHI1EAAd6kUXpUltzXWsUORqKRYWpeCtdNuK5mocjUcCiuECpMNKoN0cqXkw0Wqg6VBxFdRyaheUmg2zHS9cBqtbZq5bdDkCiQYRVLNrVyWddakyCj5CUYey1xo1CgEsegA/wB+tBNYYnWtHfUWrMfiff03ikzuSdK0pboNUUJb1q6uC2a8bdZyAW3b+cyTpyojDMBVN3DtbEsI7EifpvXsOumd9hy6mu/PNY8ZOKbkMvDASWlc5ygjcTu35fWj+C3b1kLbfzDYNIIIH+OR6UuxBL2kbqp07yfvNH8OuC7aAJPmA9j/AOa8zD62WOdyWun9jpUfjsh8QWAB4lvQCAwG2uxH7UiuYjSnty7mtMhYKu3r0+8VnsQkCK9DNGKlryRbvZbh8ZV/8TQeEsRqZq51FRlVmJvfmuKtDvcA51U/EAKyXwAMc1EvS/8A4gTyq60zGjxYaLbjGuCTVd63cOi6mp4TCP8AiBHrW46NRxny86mmL061I4GTrVwwKgamldGoE/i5O1TUOxAE0Zh0tg0ydQmigZjz/QUYpt0jA2FwGUEtBIExOg/uND23USVAY82I0H9o/U1zHYgt5EJyg+Y9T1PYcqqfQQByk+1LSlK10v8A6ZutIvDiNTqdTNQbFgUGxJrqW+tIYtXiEHaptjCeVUKizRmFtqzop/EwH1rPugoobOanasNzpliMEUnJ5wN+RX16+tB3XYASI9aD9rphoLwmADfPsdB6nn7UuucPyMZpvab+Wh9Cfc0NxhWJSBMyCJgmqyjxgpIwCIFQvXSNo9xNHDCsQD4fL6+4P5ULi8MY+Ug9DSpNx5doD0wZ+JOurWky8yoP31kUTh8faYfLHoT+tUYa+AcrCVO4/UdDUcfwcqwKGM3ykKxB7GBAPeueVN1dMO+0EX2jUVLA3C122MqkFlBGoO/KND9KX4XiLW2Nu4IOxB1BH6im/AlQXgwJIVWcabchr6mnx8lNJmWyz4xxNtb4Qtl8oIEaQSdSZ0Mil5IAnQjtrVXHLfjuzEb/AC9QAIFIbviWd5K9f07GrSSnJgk92argVzPe/tBP6frR921aJlkE88u350j+HMShzMCc8RHY7nvWj4dwjxEzliJJgRyrowYriDk/Aot4dWDMSTGscyeXrrVWOOoTpqfX/wA13Ckgg6iDrIj1FNLHDQ9jOCfEuHMCIGUTGvWpepTlKPwlYMatMGwRIBssdT5lHQ819Y1qz4fuQ7oT8rT7HX85oTEYFbIz3sTEH8KAE/fel3/uK2rHw0YyMpd2lj3geUbnvXDLF9Rtx8lVLjVjtrxc+YiCfpUsJaUwwBEmFBGp79YoDhd5XgK8xA9vQ03sT4gOhAJM+g00r05tOtko2xdisM/iXJMnMR9DpHahbmBY86bcbv8Ahqt3LKnRyOR5H05VDBkOqtp5pIIkHKNzHIk6D3rmTblQ7iLxwiFLuwAGmtdXhaA7yPzpzjMMLtkKCFXOD00WffepcPwakkqS5WBroJO0D771nOpcUxlAVYnh6IYjXQ+k8qpZoGi0wuWGa5dzjKFdlU7545x07zVeJw028ymAHAjsSFJEe/tSPKlLi2ZxfgVXMRGhVj1ywftXvHExmYMNUkQY5gwSCP2ruPxZiFMDYCf9k12xwgXkD5oyA5SNSY3BHSa2PI7TEavQHicbeDEkBl6bfQj9Zq63cNwaHTmDuPWhuH32IyXB5hoO/wDmjrVrIZESa7nivcSfJrsJ4LgxnztqFjTv+wiaOxt+bbvaBZlGvMgN+IRuInWk9/iv8tkVSDJDe4ER660Lwrir2r1oqCcxylf6gxAiuWbl/SiiaG3wzfDlhGgU5vqKZ42xbC+BEG55rbf1FR8rdDr6bGuYS5YTEXkQBQ1vM0bElh9NOXepYvHhQBEkQQeYMb9j6dak/UfT09proooqhamCIGoy/wB2n23P0qf8FIeCfIDMiNRyGvQE+1Tw2Kzq7soJU+XSYjSfrr7Vfhr5LWHGx+bvCGftWwqU9sV8UKIimWDwbKvjnSIZB1giT6VfawS5mJXMiGTGhgnQHrTLEYy26BifKSo+4+3anS+dPwGMfJTcYFgQxE6jXRu3Y0BewhzM6kquU5k5ZpABjoZJjt3pxc4TlVRbMmTBYAxOw16TQZaV88qRIjSTHWANJ0p82OVVLz0NR2wgKLlgFRryEc/TeqL9l2OghRJPoN56T09qL4PZaDKyANe5/wAfvQ/G8blORTDspUnpOs/XUd4rqjjisacv2EfVinE4jMWQXMpHzNBYsf6RB0A5mpYTjS6LmkbaqQJHKDQfCeEstsuwfMslu8tAA03iWqvjZtWnQkGLgMgjmOfrqK87JFZJcX/0ZXFWhuLAPmUAAyWA31/SjeCISro0gDyz35R3pfwvh7lgFuQBBfNuqxM96J4jxZA+VH/5bAXFAOgaIPf19a5o45U5XddDxfliPieHV3W0dCCfNzG/7VRg79234lrdiIHQ6gjflpRPFcUBiSdYEEREag/eucRtiZOhgFfcSK9GdOEZIgu2QsY13lXVVYGIB39B0qpBJKkSNiDSm9cIusdpg/79K0HCbtnws198rZiF0JkQOnOg7crCl4FXEuGPYbPaJKQJHNdOfUU14d8Vnw1VmAKjL6xzPejsHxG0BcuAyx8lvynWdCdRypDiPhlCxK3Mo6DYfequSSqzUzaJc8q5zLLz/IRsSBGtC38azyqbDU9BHWNSe1D3cWDlUCSdFWdT3J2A71bgb8GAACDsB/s1xyhKc6k9Lx/uVUtaBuIcKW5KsMxB1BMH1U9+hpBivhtgT4RLRuh0dfTk49Ne1P8AFYw5iSRmGh5T3ioX8aHGbp+KqyXCPKHXwTtN0zMYS6UaQSCD6e1aXAY7MMw1bkO4/TnXb3DFuqzXLXmBjOrQTGkmDHuaXXcGbVt/DYtrqI8ygdRufakU09V2bi0aPA4m3estbuDeQQdpn7a0KMwLhlyCQqzAGUARHb06Vn7fHBm8S3BBgv0JjXTdZo/illzaF+y2dCNSzAFDtDEmDrpNIo5Iz3+EUvktBt/HqIQNr0EmB1PKmuBvKuRE5anqTpqaxfDeKpZLC7YzXBJglu5HXXSiuC/ElxbbYnEYY2rMwrFiWf8A6baZAWjdmMCBzOlWxelnyckvOxops0mMdszDc6xHPnULkLZAeQYnKNCdDM9N59qA4VxBMTb8WW824ysusnmeXpVhe6WJa0ch2JZdvSZFee8UvqSXlMzdCe5i0a4odDEkjKYy+x3333pvwC5aQsbXyucxkmQQDMA9edV+EqKQEzgySpbL9JEfcUrwj2rd2VLJBnIwzQdJ13ggdDXWoqUO6JXxdjP4mwQci5aBBac0DmNmX9RvQGBUsudvL+GWG8c1G5H2pymO8C5lbW05if6WPynsGGnqO9CDA32xRRlD2nLOtyNEWfkIGxEgAc9O8dMJzjD27/IJQUmDW8D4rZUDt/WdlUbyYknbQDUk1zhfDjZPiP8AOBkQRqrOeep8wU6jlO8g1q7QVGt2rS5QXG2vcknnoD9KG4rbEL4YhFzIs843adySSes0uSM3jcu2OopCdslqY56sxMkx+g5CkeM45qTvr9aI4hdW55VbzKxzTrI7dR37UjxIZVIyK3MGAdQe4pMPpG/dJXYjd6NBw7ETbZs8QNI3HMn1mnGDxTMBDLcHX+n10BFYvgeLvXrwS2oEatIACqNyfrtzMVtBft4e35VEmMoGnPUmOv7088XDb1XwZaCL/FPBVjMknNGgjSP9/Sk1rG3LqZyDJaTrsqfaNT9KIbAeKRcLMoP4GHmHpyIPUx6GheLuLVsWkAUGTHvP1kz06b1JJvb+f2DJmjw3EX8MAE+XaBJI2P0qf8I1xk1gfi7gcvWlHC8QMoJmBoedMr2Kyg5CFCLIPLzMAPc/rVs2fhKN7QYe5bJXeLZLj2lAUL5SNpaSQR7GT70vuqjXA7OAJGYnNrA0UED5vfvS3HYU3XZszFjEKepO87RJ9tPZrisltEsD5djtr1J9TRnleWnHVdGvuwzEXEdUUOBDh2gHU7b+9IuL8IMeIgDKPM6TKjX5l/p7gRHpVXEgbDDISVYElf6YiYPMdu1FcO4pMEHQ8uoO81yOWTHL3bRnJS7G3Bb4u22uhYLSDPJUEtrzBP5VieLcTU4guxYRKQuzggQCeYXoa1/Ebi2bAs2yB4krqTOUks/3aPakWF+DWYqGZSplpUkkAQJMgAac9a7MeKNrinSVfuFvwU8GPjOTz0kk6ADqTtTXiWJw9uJYXnGwBhFgRqQfNWe4hiLSeS3pbUwgJ1aNMx6sd6hbuqChym425EiI99COXWsrrilfwSQXf48xMKloA8hbWPymheL41fCkqoYMsFfKPp6dIq/j/BTbi7bk2jBPVMwBE9R3ojgotXEFq6FJPmRgAWWNm7j1pX7akxq2F8GsllQNCmCSTyneO9T4pxBLNw24zRGsnpTXhS5LdtLnmYly7coExvtoJrEBfHZ7oHzO3P6faK6IxVaBXyW8Nxt2/dzW/KObQGyDsCQCY5U5/jsltboLEwR5okt7fpyFZngfEGtKyLupG8fNuf29qpxXG3AIMHzyAZ0Oo0g99qT6T5qug14NEmKN0TOYwA2x22MHcxofQVThnlgM0sCQRlZiRvEbDToTSnC8RdhJcZySATrGg1joDGnejODYW9fuTZnw4YZzoJGwGu+YcjAquWKavpCqLs1fB8S7HMIIIzEiABvy7kVDjmCP/NTc8upHLsY2+lWYG2yDJedHvZTLKIMH8zrqe9G4TG5lAMebQzsY/XfXtXlvIr4vfwyyj4MPfspdOe3C3OZ5P1DAc+9PvhIlbRlfISVZG8wb+qeRH6elc4h8It/EC5ZuLbDGWR18s75gZ0HUesdmWIz2WUOVPR1iCeenWumcXKH2+fh/cXcXYbib9tHV2OVfKofyggHTIp0gHQe1ZfjqPfuh7wkny24JKrrooG49ecc6P4vw9MVaKyUCliofSORiNYmIPSKq4bgLyIEuXlZkPkaGD9s0r/5owyzUV8/H9xuTi7TCbeFt2wLRfM0ZrpzHU7BF5wO3U0Bicelq6q27rMpHmMSVPSJDMI6A17irMlp7iqPGVTlMAg+vJj07xQvC+BC4/j3RKmCoOzncH06jrpTcIu5TW2K5W+Q48txSQ6ZokQSs+xAig8XaVNLtsOsr5gdRmA2IOwOhplcwwvMFO/IjQj07fak+NTwrrWi2ddiYiQY5cjUcmNxS/wAYqa7Gt+wl60FEsoXIQdTEaEHmRp9Kt+GeItDWLmtxef8AWOTe4pDgcYUbITtseopliL+Yi8v/ADLe/wD1Lufcb1KMpRuEt/cZS3Y9S5GZhOcxbTrmfn7AH60j41jbiMYUykBFn5EB3PR3PLcD0psl1VdWMRJKHNzaBr1AA0/upUMGG8dlv5ri3FJXTMY8oB5/MxMjeu6d8EkYW/EHBLrXP4iwhcNqyrurRrpzB7d6FXBXCJKNLARGsEgGGH4TrsYrZYZpziSASY/cUqwqknUwxYqWGh8pK++32FHBlainH4BLTOWuHLhrWYwXJ8zdYEhfQSaBwQd7hvXBCjS2hHzmB/MOuiiYAjkaLfF+MnguSROYHYgSYIOs77HrVuGtougMgCADuI39etRneSVt7evx8/6gtdoue4ACzbDVv296y/FsSxY59CCdtiD8pHUQKt+LuNZCLakCIZu5OwpXbxPjhMurHyAA7mZA/P60zg9OtLoFOh1wW7nBQSzRovqBP5nvpWgwYPgeZSWualYk5UEbfT6UquYcYdEtruChZupkfbkKjxPiTI5YucwEDoo9NmO+veoLJGU06tLr7hS4ov4XauZ1yiVDZjlIbwxlJy6SQZ0moteL4gA8iSfb/wAio4PEvaHmuEE6lUhQPUj5jQmCxFtbhLORuBmI5/nFUThyVeO/yB9Ue4pxqy1xRmEKSNfwmOY9ftVSp4d3T5X8wjYHQkekGaxfGLv85xzViD36/emHB+INohMj8PYwRp9avk9LrlfY8o0jecLwRxGIDTKgASNlQfuZ9zS74h+LHh7duLds6QB5nA0gk7DsOvOtAOIWsFgySQLjKIX8RkeUAdgR9TXyjEPeck+E5H9rH9K6Pp8YqMX+RVFld9zccZvp0FPsGtxUDoyhQ2qk7wPpr+gpLw/5xnRhrryPsCK03GeB3v4ayqHXM5I/uywCeUBJ6amlnqSSdBfdGm4Rj1vWEYDTW0ynlHL6EUh45gfDuHJIMAAg6ZeRH+8jQHw7jmw6tZvAqM+aemgEyN1PUdK0/FLJu20uIVJAJUA7gjyxO+vpUm1CcuXTBV6LuDXUuW89wxIymdN9xvuTp71Yt1FlSiaHTyDbfp3rIYfEMR4exZjE/huDUaHvNbK5xdLMW80QB017nud6831HKNVf4X8jxYu/4bYlntEBiTmQiFuayQwHyseo2MGNKy/xdwI2mD25e1caBzKtuUaOe8GNfat3j+HWnObzIxG6xE96FwJdSMzAdGUkEj3H2711xy5Iz3sFpCDg3ALL21dgSJJCtowOmmZYldK1fDCCWAgZF8oGgGoAiNgAIjvVWKBJzE76zpr/AJ7V7B2iuck5QAvSd83PbaPc1XLKLhtiRcuQxxdhChu5Vz5YDbGOYPWkWC4laRoumFD6TvqZH0r3E3unw2sw4VvMhIGh2MkjQERHQ7aUo4vgg119NFtM4mREMn7kVyOMJyTWrX8FJNo3GCxSOptsRmQwp6jl7Hb2pYuBsp+EFiS2QKBJnm3Qame3eKzHDseVKPPMK3oTofr+dMeJ8ULuLdvVmJA+vM9BvTQ5wTit3o0pJ7ZbxPiq2iRb8119AenIBRyFDYHiBFxbF0edj5SNQxgGD3137Gi0wNtZ0LXAJJUKWProY1PKgL3EoBKqFAMGJJ1Manf2/aqQgsS+ZE2+XZoGwqqMzzpy5enf8qH/AOIKoCqAANlAkgfnSPhfEhcuXELMCmXqJBnUTrv/ALrTxMN4gARognMx1108oJOpGnXnSTw5Mkrm6+yCnx0kXcPe49wMpFsBtSQCTGpEAbd6VccScRcbWCx1j9KMwGMtW8xDLmzZWJlSCN11+Xlpz03pd8SMykMDKuCR7fkRMH0qsoqCjFP7mbbQjtmUJHzIxBHv+X/2FF4fGyNz00005+lK0vZHDfhcGehZZX7rFMMJgmuNCCVbXNsB6/tvM0c0F/UL+A+41661pApBW2uY7DfKTJ05k6dKd/8ACra3XxEnMTougAOUAk9evqe1D6WQLaAs5mANTMan+78qhYvhrBAJzAkn3/LY1yZc85wqOl8lEknsPwbkoLgPJQZ5RpPpFIzjGVWBGwd2PTMzEL/cSaP4Biv5fpKn2MflSbjA8O1lLTmfMT/0g6fU0fTzfJxfjQJbSI4bEg2LeuW4GKzO5mQPv+dFW8X5QRPlOpO5Y0o4nYIt2wNfOTA1iUGlWYHFeYZh5kB0aR6E9x+1dMsff+UTfyd4x8PPebOHUF3OYGYVdI05EDTTfQ+lnBsEi4i2bSnwkuENdIhXdUYkLGmmUiBz9qJwOMAh7klS0NyLAb+nSmvFceLgtQAttHQpbGgjaT/T8x/Wg80uDjL8FYysuxahrqDTVsxPQKC0+ggVkeL8WsNiMoZrhLliRAQRLZeZfaJ0HrTLHjxrbKzsoMKSoElQQWGu0nKP+w9ajhcLhbf/AC7AnbMxYz94ao+njDHG5W38LwG4vsVYvjEAkGfWlF/EZ3RRJJ5DqaacQwqeK8qAk+RQYnrJ3C/Qn71DD2FXzwFHLKIJPQHeu7GoRWlsTSAPimwzYwlBJcIYEb5VB/f3qeCwr5hJCxzOp07D9auxvE5YgnVdDHPsDyA29qT4zjJOi/4/zXTFSklGukU909UaS7xFEJd3zN/U25+v5UBifiZifKT6kkf5rN3HLGSZNE4OyNzsKz9PHuWxvpqK2aXAcbuH52zL0iR2jMPyrZ8DYvcK3BKlVzKSdN9uhFYHgt0G8hYQiENHv9z+1bzgWMUu7qJWFk7ZQJJJO1cHqbjJcUTS2KcfgmOIbxsgtWmfKDvcUHy5o5c4PfrVdzi+doMnMRGuUb8+o5cqU/E/HDevuyn+XmOUde5pZbvu3ygmNdOVUeKU9yA18Gq8BrVxfGtIoLZ7ZWIJA3ldCd967b4s0T4gWdfWdZ/T2pNZv5VVyykNpEnUjcGY1orBYOVnM0Tp6aR9NvapzxL/ANjWaW3jPGsr21btG33oB0cSZYKOYJEe1e4cwXOhMLMz1WZ/xRN3iSAG2wILDpt0manp2xejmC4hH8q42ZX1k6RyB+2/eqk44ozqxg/KeeoPOlXECVZG0jQaHSCNYq/BcLt33LXC0LuBILnnr99Ndd6ywxn2Gxjw/EgFmDd5nlG36/SqcXxEFWMzn0HoTt+WlOMRw+0beQIq8jl8rAR1G59ZpI/wuLcrdvBU8rgkFCQY5klQBHrv2rfp1GVv7Bu1oQpdKsVAJMzAE5o7dNjUMJxN0Yt+I6Htrt9vtWqtpYQ5rKK7xlzKw/UkzQycMsADNZAeZBYM+v8A3EiT+tWjkg200DSBsDxQwrABS1wCQTqBvzj8Q26UZjwcSgJADq2YwAM//V/dE+tSOBt5FJRcoIiJWCT2PWjFRFIjMIPPUTv2NNjnFWnaEb+BTiMYtt7l5gJACqcoWZAY7chIA99qTYDjLXHctnymMqrAC+5MKe9WYrxVu3rd20LtshiD+IIH0dGHMSJkHvpTrhvAkY2PB8Q2LhYurgHLkBklgNydBz10quRxjFzlsso6DsDw9XVVIC+IpCiexIJPcjfuasw+DPgXcO6y9rzIDzG+mvMaaUVi3/nWgNIJEDoFP7UXxG+EuWGJ1OYHusp+Rb7mvHfqJTmrXe19qCopIyy8Is3UjKyCQVcNuYB0DToJ196ZrcTD2g2wHykxt/Ue/SuhR4lwHRFJXSAAF1j8vvSTjmJF62xBBBIRAOWoXX8hXVFTy+29f2J2POE4E3LT4q6QqzltZtACxChj6MftQ96z4DhgSVKDxTqYzEanpBIHtRvxfxZLNmzh1VjkCF42zaQDz66R+IUiw3FTiFuC2PPcYZ1BlQvWSBBJ/WuzNgSiopaQz0d/iDbuOoOjDMPyP2igeN4kMEG85Rp9f/5NG4jhhRENxxIY5YkkjTTUR1170HibVo6glDMyDPLLse3SN65oRjGavsS0H4RSbN0KxFxQzAg6ggdfYikPBLD3ryImpJlm5KvNmPQfeY50yw7iwDcV1YeEyuAZhhmKnXUSWj3FQs4vwbCYe0Ie558Rc7QIUHooI06k10QjXJva/wCAqqPccthWYI+ZAWCEfiA7VLDYsmwDOikD6Eb+xqjEvKwDAGg5QKU3cabVplYHJn8wneIkf5pFD6iS82BK3oeB/IJYBTIEnV23YL2E6n2q3DXAW7KPz/wPvWQwOKuXrqt5iFkA7KgMwo5D9a1nCuG3CdWXUyQMxMD27Vs+Dhq9jThwdEcVg3N1iICkmCSB+ZpdxHEZIEhWMhNQY6tI0nUf6KZcat3bdm5dZYCxIJ1MsFURuBJEnvWCu3XuNLGSefTt2Haremxc93pD48fLbCL4K6GgxaaSYPbSjMQ0gKTrGneP1qu3cNzQnzDQeg6V3xtIvG0juBw5chRuaaXMIFGnKqOHYrw2K3FIJjXT70bxPFogkkGflHNv2AqOXk5JIlPk5UgO3jMjRlzdRMan846d6ePx26bdy3EZwCSDqRG0RtpWYsDND76nN68vr+lXX8bFxWnRRGnPcwfrQniUmtdGcN0grA4c3HCjnz6DmTTD4oxHhC3asKwVJZnC/Ox0OaPmH0igeGYmBIXV5J5QsxTj4Yw4a7rcdl3UMdVImUPUGe21CU4403JASp2z3whi7bsPEGV2DModAVfSDDMNSBy1mR01PfAqCcqPE/hR4/OvfGXGENtbKhfE0KuQJQExmU/hJiBHc9KR3eOvbhLgLMAJZXIB7xl3qNPLFSSr7Czx27QRw3G3AQjqwOTynWHUrIE+u3uOVFYy6M9otJBGVjMSeRrMXsVdQLZKqFtZhpBJLwxllO46TpFar4eLY3CvaQZnQoVYgqIOjanTMIUmJ370c2Di+S6GnifYRct27toorMrTIzEEAjkYA071XwviuS+ltnC7I0kaFhGgBnRiDr0pnheAjMTnYjoBAn1J29qYcb4Phrl7Ci4MrWlzOFOrqCSq+haZY66RzqOGFXfRKLXkmo1ltAPf/TV2GxS3Ge1ft57dxfKrmRKmCI5Ea6jmKFxWJU31CEEuXhdZBCk8+RirrgCEXD9f0PehJ3LXgVe0zPGOCNh7g8NC9srnWYMwxlD1gEHWM06bGHWD4S7AXWuMgZdEVVUbaNt5RvI59ud+M4ijkkLIPJtR6RUf+KOZ0BG2qj2G32rny503SjZTkqoXYjEsD4fzhpAKjX1gc6K/iBk7rE8te86j3ohsYyq1xzAAkIo+boNOp5VTheDX3tltEfWC/OTzA1g70MOZ+VroRxT6KrxJUZTo2rDqPyNd4V4i4m3lcNa1BzeUgFSAoGx1IGn2o63wd8gDOuYD8CED6E6VzFcPRQCWB5aTI5nl5fc1ecITTjHt/IFyi7OYl5xNof3H7f5oH4v4gPFCg/LCzPOdfv8AlU8fxBEuW8RmBULcM9WA0HqSPvWM4hijcVWYzBLH13195NcnpvStyTfhV/JW70P8Zxj+Uo3a4zs0cxnb6/4NKL+LhgViQQwHcGQfWQPpQXE+IAKE2OQKs/hVYgdp1PqTW6+Bvg0vbXE43QEAojaEjcF/Xpv16V6+PDS0Dg+yrgXw/exAS9dz5MzOoJP8xmEZzOsQSBrqDppT/i74Xh9iCql9SEGmYxqTzIHNqr418ayRbww01HiEeXTSVHP1OnY1kuNYIYgEux8ScyvuwP6jlFWUU+v3BcU6FmL4+9+6xueU6QIiB0A5D96hhwT4Tyo8txiW1OrEADqdIrO3b727pzjzq3mH2kdjTHHXv5Vog/hZf/3Y/kRUni4yv5Hljpk8FdzXTmMKSS6k6GJI/IA1OziyqhnMsxLEbnUzp2AoOz5VBMZtY6dJjnuB9aLwyMzQqtcbogJP/cQNPStJJ99Ga8ELmNY6BYHKSP2qfEbPiXFEwFCtoJBkAmdtzR9n4feC17+Wo3LPLR6KIHoYrwsI38u0FMR8zLLkCJJSTHRRHPekTjfsNpdFeHVEFu3bRmJgKP6iTE95POtmqeCkSCY85Gknf2XoO1VcLwgTwg4BdFIDRGoDAEewFU49y7i0Pxan+0f7Fed6ttzUP9WIn2/JziGNS3hL1y6MyuhXKRM5tEH1hu2/KvlYECTsN61Pxlx0XSLNsTaQ/NGjtqJHRQCQDzknpWRugk+YmNYr1PQYHjx+7Te6OrFHVMre6SZ26UTbM6//ACP+9ao8HpTa3gS2DLrvbuknsrKoJ+qrXbJxVfsVbQvvXR8oMidRuP8AfSpXMR5QGYn5tdz5o019BQxaDPPttVTNNMohUR18Ov58sSrK0+2s699Pc0NjsRbzEIhXfNJnWTt2q7D2LlpQcrI7jy5gRKnSV031oM2FEEEtprHKkSVtiJK2w7DcTVSGAYADK0HWNP1misLxg6uJJAM67xt6b/alNlVIOoOshdAZ9ToR71ZZuFluB5A01iIM9PQHShLHFqqA8cWF3eIG673GQeYCQpgSoGus6Ry03oS/xlyZihr12QdInQfqaqAplBLwOoI+wX/h7Cuhz2oXfRnB11676/8Air+EG3YtsLaC1ZGpGpLaRJJ30Hc0KcSTcCnZQJ9TBP3NMVujUGCMraHXcqv5E14E8k5Rbt18HnKbvjZzh/H0Y5h9ySPSOVQ4o9ov4twsrEQCIYHbQbe4PShuKcJsWLb3VzF8hypPlzEGNNz135Uq4XxlbqZLg9VP5/5rNy4/KX7oJLjeKazcVj5hoUYHeDqD7TWnOKtYi2NitxJ39iPUEb1k+KrkGR/Pab5TzU9PX86E4Fjmst4JMqxm23/Ud19D9iO9ViuUeS7/AJRktUhpaYpcKRmymByB6E+0aetH22MyxBOw5D0A5UNjMSluyLzKxKsEfL31BM9Jio4a4bxXylCdIJ7STt0IHua55Y5S6WmL1sd8Mg+fc7A9PSrcfjMq5m0APmM/KACSfTQD3oLiHEbeGtyTsNB+tYnjfH2xDZFnKSMx3zbGAByn8qviw37V0u2NGLextxj4vuXj4dmUTm34m/YVf8OWmVZBOp6nXuaWcO4WwuM5AVVmMzKJgabnanliyEVfGuG3nB8O1b8pI/qJPmy9OtX4xj0gSt6Rfj8ALq5XAK9gFI9I5+s0mxHwu4tHwWLsGLBWUKSI0EgwTMHbWmGK4anhXIHmho1zcp58+9Qv/Fdmxh7LLlNxsv8ALUgHWZJ6CRG3OtjlKT0jQUulsUfAnw54mLZ8RqlppII0LToDO4Agx1KjrWl+OfjRWZsPYYl2Vg7cramZCkH/AJhEjt66Uh4l8QGzZKjKty6xaUJGXTzGT6gD07VleDX18ViJMjc8+Z7zNd8G5K2dSTlbZq8FiAhW22gYaDoe3aigTmJ1AEj3nekWO4vae6LZWDlChiCvmmYI3AP2p3w/EZwVbRk3B5jkT6bfTrQ6dM5pxa20Zr4k4dcuXQ1tSzaLA1J1Maf7vQ4tEIA4yZYJBBnaIg96fcSxfh53UTrlE7SN/WJ/2KTcNY3byKwm2ssRy2mD2nSO9I5Ot9IrGTcafgdcIwefJcuKFQKAi7swH4ifwg6nTUzypzicelpJkKoGw0H050vv4wICSdazOL4y7uxgBdgGE6ddN/qK8/6cvUSt9CRTm/sWcV48198okWxBj+ob+b9qt4Ew/jbaqANSB2JVgPtS0FQCZWSdfK3/AN6ZcOvZmtuirntOrE5tWWTMEgcidJ9K9GMIQVLSLNKqRvrqQSQT0/T86yvEeIlQ6g/zLkgn+lRpE9Tr/wDI01x3HF08MEtM5joPYe/5VnXS3mzENzJynf8A+U61x8YSycmjnxr5K7dsRGUERBFIcbYyNA+U6j06e37VqLLADqd6A49w/LazjdYb2Oh/Q16KL45bozN61Go2rV/BRBtuh2bOpn0X96Q4ewX8nWPzG3ett8HcCJUgQrKxIXqCI36yKj6qX/iY+SftryfPcXg2tmGEakT3G9FcNS2wUODoTMDfmNe8RWn/APUbguIV1i2xtlQxKiRmlgZjsAfes7gcOyfKoZ4nK0ED/tPzGrQyc8aflleVxtjLH/FL32ymymUggCCWHcGRBnnSVHFttIaZBzTA7SpEnuDXGus/mYKCNPKirv1ygV4FAkGSxJ05bR6z0pklHSQUktIacNOHvEhrRVo3VzB9J50xucEsshVXcTtJDZfaASOUTWcsFVBGXMWOgk+XLzP36etaP4a4ZduWy7MyrmBDNrmXWYBM++3rUMsZr3RlRHLcfcmAf+0XZ1VLilTpJkZfUdPQmtdgf/TtgsSG7zE6CdPWl+JtvaOuoOzD/dDTfA/EZCAGZrjy+pzLVJkvrOS2N8KlpWY5ASZ1bXf7VRhPDzs9y4FWYUSNTIk68gFX616vV5mFt2RfYLx7Fq+Zhc0BARV/F1JPJQPuaz6KgYtlkn1+0c69Xq646WjFvDeJZot3Bmnl1ovi/wAOZ0m1owIIBIUzziTpp+Vcr1V/pno3T0ECzeOGuJcQG5AbLmVizIwI0BM+nOn3B+DulpGZTmCS2xadSfKNefTpXq9Qulr5Cly7ML8Q5r15i+eF3RVJKifxn8PLrU72HtJa+Xw2b5AskkafMTrH0r1eq6fURvBRwjEkMoEFVObUxJ25ctqlxvAXrrvfzs7EyQZLeiQNVHIDYV6vVuTjLQE6YF/xy+LZteKyb6gCdepIze4Mil2H4ab0AMq3BuGMBhuCDzP79q9Xq6U+KdHRF0tHviCxcV5dTljKh5Qv+zQWDx7WnDgAx1516vVbC+UFZXHuKsu/igxkhSCSSI0E9J2FOOG44rBEtB2J1gjYHpp9/SuV6kyonliqNDiUS4oyaGQU3ETzPfeq8a+RYDGR1Ob6zXq9XPlVxOPyZ/F47P5X+oNA3sCxEo09jv7dfSvV6nj7Fo6I+3oEwlsMwDMRJ6E8v3itThLaoAkjYSRzMDX/ABXq9W9V0hs/RzFXmCsVUsVE6dKV4LC3bsupZddgG5DtXq9U4ezHyXZOGo6LsZwm9ZIYkldDnEtH93Me+ldxeJLW2LNOnaCuxAr1eqmOblV/I620V8Mw4L5UzEZTqBJHQmNtOfatZ8I8SDeIuudDIJ3YHSfZhr/cK7XqT1avEwzW2bDBY7MNduYNZT48+F7Z/wDyrAyXF8xA2aNfrXq9XJjySilJEMcnZ88x1xSxcR5oMbQeftP60DnOYE66zXq9XsxO+J9C/wDTXhli9auXLlpXfOdxOUQIH61seI8OGWQBB2I0gjae2m9er1eZ6iTU2cWXc2Ya9futfayd+emmv5COlOMPw6yi5WXMes1yvVzepm00kIz/2Q==",
        author: "Trần Văn F",
        publishDate: DateTime(2023, 12, 20),
      ),
      AgriculturalGuide(
        id: 7,
        title: "Quy trình chăm sóc cây trồng hàng ngày",
        content: """
        Bước 1: Kiểm tra tình trạng của cây trồng mỗi ngày.
        Bước 2: Tưới nước đều đặn và theo lịch trình.
        Bước 3: Loại bỏ cỏ dại xung quanh cây trồng.
        Bước 4: Kiểm tra và kiểm soát sâu bệnh thường xuyên.
        Bước 5: Cung cấp phân bón cần thiết cho cây trồng.
        """,
        imageUrl:
            "https://vuoncayvietnam.com/wp-content/uploads/2020/01/5-buoc-cham-soc-cay-xanh.jpg",
        author: "Lê Thị G",
        publishDate: DateTime(2023, 12, 21),
      ),
      AgriculturalGuide(
        id: 8,
        title: "Kỹ thuật sử dụng phân bón hữu cơ",
        content: """
        Bước 1: Tìm hiểu về loại phân bón hữu cơ phù hợp.
        Bước 2: Phân phối phân bón đều đặn trên diện tích trồng.
        Bước 3: Sử dụng phân bón hữu cơ theo liều lượng đúng.
        Bước 4: Kết hợp việc sử dụng phân bón hữu cơ với các phương pháp khác.
        Bước 5: Tăng cường kiểm soát và điều chỉnh liều lượng theo tình trạng cây trồng.
        """,
        imageUrl: "assets/images/organic_fertilizer.jpg",
        author: "Nguyễn Văn H",
        publishDate: DateTime(2023, 12, 22),
      ),
      AgriculturalGuide(
        id: 9,
        title: "Kỹ thuật trồng cây tự nhiên",
        content: """
        Bước 1: Chọn loại cây phù hợp với đặc điểm đất.
        Bước 2: Tạo ra môi trường thích hợp cho sự phát triển của cây.
        Bước 3: Hạn chế sử dụng hóa chất trong quá trình trồng cây.
        Bước 4: Sử dụng phương pháp tưới nước tự nhiên.
        Bước 5: Kiểm soát cỏ dại bằng phương pháp tự nhiên.
        """,
        imageUrl: "assets/images/natural_farming.jpg",
        author: "Trần Thị I",
        publishDate: DateTime(2023, 12, 23),
      ),
      AgriculturalGuide(
        id: 10,
        title: "Hướng dẫn xử lý sự cố thường gặp",
        content: """
        Sự cố 1: Cây trồng bị héo và mất màu.
        Giải pháp: Kiểm tra lượng nước và dinh dưỡng đang nhận được, điều chỉnh nếu cần thiết.
        
        Sự cố 2: Sâu bệnh xâm nhập và gây hại cho cây.
        Giải pháp: Sử dụng phương pháp tự nhiên hoặc hóa học để kiểm soát sâu bệnh.

        Sự cố 3: Cây trồng không phát triển đều.
        Giải pháp: Kiểm tra đất, nước, và ánh sáng để đảm bảo môi trường phát triển tốt.
        """,
        imageUrl: "assets/images/troubleshooting.jpg",
        author: "Lê Văn K",
        publishDate: DateTime(2023, 12, 24),
      ),
      // Add more guides as needed
    ];

    return Scaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Hướng dẫn",
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        titleType: AppBarTitle.text,
        onLeadingPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
              onPressed: () {
                Dialogs.materialDialog(
                    msg:
                    'Chỉ có chủ hội và chuyên gia hoặc người có quyền mới sử dụng được tính năng này.',
                    title: "Bạn không có quyền truy cập",
                    color: Colors.white,
                    context: context,
                    actions: [
                      DiaLogIconsButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Trở lại',
                        iconData: Icons.cancel_outlined,
                        color: Colors.white,
                        textStyle: TextStyle(color: Colors.grey),
                        iconColor: Colors.grey,
                      ),
                    ]);
              },
              icon: Icon(IconsUtils.add))
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const CommonDivider(),
        itemCount: guideList.length,
        itemBuilder: (context, index) {
          AgriculturalGuide guide = guideList[index];
          return Card(
            color: ColorConstant.background_color,
            elevation: 0.1,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListTile(
              title: Text(
                guide.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text("Người đăng: ${guide.author}"),
                  SizedBox(height: 4),
                  Text(
                    "Ngày cập nhật: ${guide.publishDate.toLocal()}",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nội dụng: ${guide.content.substring(0, 50)}...",
                  ),
                ],
              ),
              onTap: () {
                // Navigate to the detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuideDetailPage(guide: guide),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
