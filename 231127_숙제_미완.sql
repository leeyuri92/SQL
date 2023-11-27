--����1 ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�

--1.1 ������ȣ�� 1�� ������ �̸�

select bookname
from book
where bookid=1;

--1.2 ������ 20000�� �̻��� ������ �̸�

select bookname
from book
where price >=20000;

--1.3 �������� �� ���ž�

select sum(saleprice)
from orders
where custid = (select custid
                from customer
                where name ='������');
                
select sum(saleprice)
from customer, orders
where customer.custid = orders.custid
and customer.name like '������';


--1.4 �������� ������ ������ ��

select count(*)
from orders
where custid = (select custid
                from customer
                where name ='������');

--1.5 �������� ������ ������ ���ǻ� ��

select count(publisher)
from orders, book
where custid = (select custid
                from customer
                where name ='������')
and orders.bookid = book.bookid;

--1.6 �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����

select bookname, price, price-saleprice
from orders, book
where custid = (select custid
                from customer
                where name ='������')
and orders.bookid = book.bookid;

--1.7 �������� �������� ���� ������ �̸�

select bookname from orders, customer,book
                  where ORDERS.BOOKID=book.bookid
                    and orders.custid= customer.custid
                    and name like '������';

select bookname
from book
where not exists (
                  select bookname from orders, customer
                  where ORDERS.BOOKID=book.bookid
                    and orders.custid= customer.custid
                    and name like '������');


--����2 ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL�� �ۼ��Ͻÿ�

--2.1 ���缭�� ������ �� ��

select count(*)
from book;

--2.2 ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�

select count(distinct publisher)
from book;

--2.3 ��� ���� �̸�, �ּ�

select name, address
from customer;

--2.4 2020�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ

select orderid
from orders
where orderdate between '20200704' and '20200707';


--2.5 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ

select orderid
from orders
where not exists (select orderid from orders 
                  where orderdate between '20200704' and '20200707');

select orderid
from orders
minus
select orderid
from orders
where orderdate between '20200704' and '20200707';

--2.6 ���� �达�� ���� �̸��� �ּ�

select name, address
from customer
where name like '��%';

--2.7���� �达�̰� �̸��� '��'�� ������ ���� �̸��� �ּ�

select name, address
from customer
where name like '��%��';

--2.8 �ֹ����� ���� ���� �̸�(�����������) 

select name
from customer
where custid not in (select custid from orders);

--2.9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��ձݾ�

select sum(saleprice), avg(saleprice)
from orders;

--2.10 ���� �̸��� ���� ���ž�

select name, sum(saleprice)
from orders, customer
where orders.custid = customer.custid
group by name;

--2.11 ���� �̸��� ���� ������ ���� ���

select name, bookname
from orders, customer,book
where orders.custid = customer.custid
and orders.bookid = book.bookid;

--2.12 ������ ����(book ���̺�) �� �ǸŰ���(Orders ���̺�) �� ���̰� ���� ���� �ֹ�

select bookname
from book, orders
where orders.bookid = book.bookid
and (price-saleprice) = (select max(price-saleprice) 
                         from book, orders
                         where orders.bookid = book.bookid);

--2.13 ������ �ĳ��� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�

select avg(saleprice)
from orders;

select orders.custid, name,avg(price)
from book, orders ,customer
where orders.bookid = book.bookid
and orders.custid = customer.custid
group by orders.custid,name;


select name, avg(price)
from book, orders ,customer
where orders.bookid = book.bookid
and orders.custid = customer.custid
group by name;


select name, avg(price) r
from book, orders ,customer
where orders.bookid = book.bookid
and orders.custid = customer.custid
group by name;

select
from 
where r > (select avg(saleprice)
from orders);



--����3 ���缭������ ������ ��ȭ�� ������ ���� SQL ���� �ۼ��Ͻÿ�

--3.1 �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�

--3.2 �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�

--3.3 ��ü ���� 30% �̻��� ������ ����

--���� 4 ���� ���ǿ� ���� DDL���� DML ���� �ۼ��Ͻÿ�

--4.1 ���ο� ����('������ ����','���ѹ̵��','10000��')�� ���缭���� �԰�Ǿ���. ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�

--4.2 '�Ｚ��' ���� ������ ������ �����Ͻÿ�

--4.3 '�̻�̵��' ���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ �����غ��ÿ�

--4.4 ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�

--4.5 (���̺����) ���ǻ翡 ���� ������ �����ϴ� ���̺� Bookcompany(name, address,begin)�� �����ϰ����Ѵ�.

--name�� �⺻Ű�̸� VARCHAR(20), address�� VARCHAR(20), begin�� DATE Ÿ������ �����Ͽ� �����Ͻÿ�

--4.6 (���̺� ����) Bookcompany���̺� ���ͳ� �ּҸ� �����ϴ� webaddress�Ӽ��� VARCHAR(30)���� �߰��Ͻÿ�

--4.7 Bookcompany���̺� ������ Ʃ�� name=�Ѻ���ī����, address=����� ������, begin=1993-01-01, webaddress://hanbit.co.kr�� �����Ͻÿ�





--[���� 4-1] -78�� +78�� ������ ���Ͻÿ�.(ABS)

--[���� 4-2] 4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�.(ROUND)

--[���� 4-3] ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.(ROUND)

--[���� 4-4] ���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ����� ���̽ÿ�.(REPLACE)

--[���� 4-5] ���½����������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.(LENGTH, LENGTHB)

--[���� 4-6] ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.(SUBSTR)

--[���� 4-7] ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.

--[���� 4-8] ���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. �� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.

--[���� 4-9] DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�.(NVL)

--[���� 4-10] �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. ��, ��ȭ��ȣ�� ���� ���� ������ó���������� ǥ���Ͻÿ�.(ROWNUM)

--[���� 4-11] ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.

--[���� 4-12] ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.

--[���� 4-13] �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.

--[���� 4-14] �����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.

--[���� 4-15] 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.(ALL)

--[���� 4-16] EXISTS �����ڸ� ����Ͽ� �����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.(EXISTS)

--[���� 4-17] ���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���).

--[���� 4-19] ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���).

--���⼭���ʹ� ��, �ε��� ���� --

--[���� 4-20] �ּҿ� �����ѹα����� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�. ���� �̸��� vw_Customer�� �����Ͻÿ�.

--[���� 4-21] Orders ���̺��� ���̸��� �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��, ���迬�ơ� ���� ������ ������ �ֹ���ȣ, �����̸�, �ֹ����� ���̽ÿ�.

--[���� 4-22] [���� 4-20]���� ������ �� vw_Customer�� �ּҰ� �����ѹα����� ���� �����ش�. 

--[���� 4-23] �ռ� ������ �� vw_Customer�� �����Ͻÿ�.

--[���� 4-24] Book ���̺��� bookname ���� ������� �ε��� ix_Book�� �����Ͻÿ�.

--[���� 4-25] Book ���̺��� publisher, price ���� ������� �ε��� ix_Book2�� �����Ͻÿ�.

--[���� 4-26] �ε��� ix_Book�� ������Ͻÿ�.

--[���� 4-27] �ε��� ix_Book�� �����Ͻÿ�.