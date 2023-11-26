-- < Book ���̺� >

select *
from Book;

-- [���� 3-1] ��� ������ �̸��� ������ �˻��Ͻÿ�.

select bookname, price
from book;

-- [���� 3-2] ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.

select *
from Book;

-- [���� 3-3] ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.

select  publisher
from book;

select distinct publisher
from book;

-- [���� 3-4] ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.

select *
from book
where price <20000;

-- [���� 3-5] ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.

select *
from book
where price between 10000 and 20000;


-- [���� 3-6] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.

select *
from book
where publisher = '�½�����' or publisher ='���ѹ̵��';

select *
from book
where publisher in ('�½�����','���ѹ̵��');

-- [���� 3-7] ���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.

select publisher
from book
where bookname = '�౸�� ����';

select publisher, bookname
from book
where bookname like '�౸�� ����';


-- [���� 3-8] �����̸��� ���౸�� �� ���Ե� ���ǻ縦 �˻��Ͻÿ�.

select publisher, bookname
from book
where bookname like '%�౸%';

-- [���� 3-9] �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.

select bookname
from book
where bookname like '_��%';

select bookname
from book
where substr(bookname,2,1) = '��';

-- [���� 3-10] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�

select *
from book
where bookname like '%�౸%' 
and price >= 20000;

-- [���� 3-11] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.

select *
from book
where publisher in('�½�����','���ѹ̵��');

-- [���� 3-12] ������ �̸������� �˻��Ͻÿ�.

select *
from book
order by bookname;

-- [���� 3-13] ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.

select *
from book
order by price, bookname;

-- [���� 3-14] ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.

select *
from book
order by price desc, publisher;

-- < Orders ���̺� >
select *
from orders;

-- [���� 3-15] ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.

select sum(saleprice)
from orders;

-- [���� 3-16] 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.

select sum(saleprice)
from orders
where custid = 2;

-- [���� 3-17] ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.

select sum(saleprice) ���Ǹž� ,
       avg(saleprice) ��հ�,
       min(saleprice) ������, 
       max(saleprice) �ְ�
from orders;

-- [���� 3-18] ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.

select count(*)
from orders;

-- [���� 3-19] ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.

select custid, count(*) ��������, sum(saleprice) �Ǹž�
from orders
group by custid;


-- [���� 3-20] ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ���� ���Ͻÿ�.

select custid, �Ѽ���
from(
select custid, count(*) �Ѽ���
from orders
where saleprice >=8000 
group by custid)
where �Ѽ��� >=2;

select custid, count(*) �Ѽ���
from orders
where saleprice >=8000 
group by custid
having count(*) >=2;


-- < ������ʹ� Customer, Orders, Book ���̺� �� �˾Ƽ� ��  >
-- [���� 3-21] ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.

select *
from customer, orders
where customer.custid= orders.custid;

--[���� 3-22] ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�.

select *
from customer, orders
where customer.custid= orders.custid
order by customer.custid;


--[���� 3-23] ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.

select name, saleprice
from customer, orders
where customer.custid= orders.custid;

--[���� 3-24] ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.

select name, sum(saleprice)
from customer, orders
where customer.custid= orders.custid
group by name
order by name;

--[���� 3-25] ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.

select name, bookname
from book, customer, orders
where orders.custid = customer.custid
and orders.bookid=book.bookid;

--[���� 3-26] ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.

select name, bookname
from book, customer, orders
where orders.custid = customer.custid
and orders.bookid=book.bookid
and book.price =20000;

--[���� 3-27] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.

select name, saleprice
from customer left join orders
on customer.custid = orders.custid;

--[���� 3-28] ���� ��� ������ �̸��� ���̽ÿ�.
select bookname
from book
where price =(
              select max(price)
              from book
              );


select max(price)
from book;

--[���� 3-29] ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.

select distinct name 
from orders,customer
where customer.custid = orders.custid;

select name
from customer
where custid in(select custid from orders);

--[���� 3-30] �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.

select bookid
from book
where publisher = '���ѹ̵��';

select custid
from orders,book
where orders.bookid = book.bookid
and publisher = '���ѹ̵��';

select name
from customer
where custid = (
                select custid
                from orders,book
                where orders.bookid = book.bookid
                and publisher = '���ѹ̵��');
                
select name
from customer
where custid in (
                select custid
                from orders
                where bookid in(select bookid
                                from book
                                where publisher = '���ѹ̵��'));
                                

--[���� 3-31] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.

select publisher,avg(price)
       from book
       group by publisher;

select bookname
from ( select avg(price)
       from book
       group by publisher)
where price > avg(price);

select a.bookname
from book a
where a.price > (select avg(b.price)
       from book b
       group by b.publisher);

select bookname
from book a ,(
select publisher,avg(price) ���
       from book
       group by publisher)b
where a.publisher = b.publisher
and price > ���;

select a.bookname
from book a
where a.price > (select avg(b.price)
                 from book b
                 where a.publisher = b.publisher);

--[���� 3-32] ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.

select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

select name
from customer
where not exists (select custid
              from orders
              where customer.custid = orders.custid);


select name
from customer left join orders
on customer.custid = orders.custid
where orders.custid is null;


--[���� 3-33] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.

select name, address
from customer
where custid in( select custid
                 from orders);
                 
select name, address
from customer
where exists (select *
              from orders
              where customer.custid = orders.custid);
              
              
              
--������ �� ��밡�� �Լ�(32�� ���� ����)

select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

select name
from customer
where not exists (select custid
              from orders
              where customer.custid = orders.custid);

select name
from customer left join orders
on customer.custid = orders.custid
where orders.custid is null;

