<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$( document ).ready(function() {
    $.ajax({
        url:'medicine/test',
        type:'get',
        dataType:'text', // �������ִ� Ÿ���� �����������
        beforeSend:function(jqXHR) {
            console.log("ajaxȣ����");
        },// ���� ��û �� ȣ�� �Ǵ� �Լ� return false; �� ��� ��û �ߴ�
        success: function(data) {
            console.log("ȣ�⼺��");
            console.log(JSON.parse(data));
        },// ��û �Ϸ� ��
        error:function(jqXHR) {
            console.log("�����Դϴ�.");
        }// ��û ����.
    });
});
</script>

</head>
<body>
������ ��Ʈ �׽�Ʈ
</body>
</html>