-- [���� 3-1] ��� ������ �̸��� ������ �˻��Ͻÿ�.
SELECT	bookname, price
FROM	Book;

SELECT	price, bookname
FROM	Book;

-- [���� 3-2] ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
SELECT	bookid, bookname, publisher, price
FROM	Book;

SELECT	*
FROM	Book;

-- [���� 3-3] ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
SELECT	publisher
FROM	Book;

SELECT DISTINCT	publisher
FROM   Book;

-- [���� 3-4] ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	price < 20000;

-- [���� 3-5] ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	price BETWEEN 10000 AND 20000;

SELECT	*
FROM	Book
WHERE	price >= 10000 AND price <= 20000;

-- [���� 3-6] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	publisher IN ('�½�����', '���ѹ̵��');

SELECT	*
FROM	Book
WHERE	publisher NOT IN ('�½�����', '���ѹ̵��');

-- [���� 3-7] ���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
SELECT	bookname, publisher
FROM	Book
WHERE	bookname LIKE '�౸�� ����';

-- [���� 3-8] �����̸��� ���౸�� �� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
SELECT	bookname, publisher
FROM	Book
WHERE	bookname LIKE '%�౸%';

--[���� 3-9] �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	bookname LIKE '_��%';

--[���� 3-10] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	bookname LIKE '%�౸%' AND price >= 20000;

--[���� 3-11] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
SELECT	*
FROM	Book
WHERE	publisher ='�½�����' OR publisher ='���ѹ̵��';

--[���� 3-12] ������ �̸������� �˻��Ͻÿ�. 
SELECT	*
FROM	Book
ORDER BY	bookname;

--[���� 3-13] ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
SELECT	*
FROM	Book
ORDER BY	price, bookname;

--[���� 3-14] ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
SELECT 	*
FROM 	Book
ORDER BY 	price DESC, publisher ASC;

--[���� 3-15] ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT	SUM(saleprice)
FROM	Orders;

SELECT	SUM(saleprice) AS �Ѹ���
FROM	Orders;

--[���� 3-16] 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT	SUM(saleprice) AS �Ѹ���
FROM	Orders
WHERE	custid=2;

--[���� 3-17] ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
SELECT	SUM(saleprice) AS Total,
		AVG(saleprice) AS Average,
		MIN(saleprice) AS Minimum,
		MAX(saleprice) AS Maximum
FROM	Orders;

--[���� 3-18] ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
SELECT	COUNT(*)
FROM	Orders;

==[���� 3-19] ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT	custid, COUNT(*) AS ��������, SUM(saleprice) AS �Ѿ�
FROM	Orders
GROUP BY	custid;

--[���� 3-20] ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ���� ���Ͻÿ�.
SELECT	custid, COUNT(*) AS ��������
FROM	Orders
WHERE	saleprice >= 8000
GROUP BY	custid
HAVING	count(*) >= 2;

--[���� 3-21] ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
SELECT	*
FROM	Customer, Orders
WHERE	Customer.custid=Orders.custid;

--[���� 3-22] ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�.
SELECT	*
FROM	Customer, Orders
WHERE	Customer.custid=Orders.custid
ORDER BY	Customer.custid;

--[���� 3-23] ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT	name, saleprice
FROM	Customer, Orders
WHERE	Customer.custid=Orders.custid;

--[���� 3-24] ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT	name, SUM(saleprice)
FROM	Customer, Orders
WHERE	Customer.custid=Orders.custid
GROUP BY	Customer.name
ORDER BY	Customer.name;

--[���� 3-25] ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�. 
SELECT	Customer.name, book.bookname
FROM	Customer, Orders, Book
WHERE	Customer.custid=Orders.custid AND Orders.bookid=Book.bookid;

--[���� 3-26] ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
SELECT	Customer.name, book.bookname
FROM	Customer, Orders, Book
WHERE	Customer.custid=Orders.custid AND Orders.bookid=Book.bookid
			AND Book. price=20000;

--[���� 3-27] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
SELECT	Customer.name, saleprice
FROM	Customer LEFT OUTER JOIN Orders 
			ON Customer.custid=Orders.custid;

	SELECT Customer.name, saleprice
	FROM   CUSTOMER, ORDERS 
	WHERE  CUSTOMER.custid=ORDERS.custid(+)

--[���� 3-28] ���� ��� ������ �̸��� ���̽ÿ�.
SELECT	bookname
FROM	Book
WHERE	price = (SELECT MAX(price) 
                      FROM Book);

--[���� 3-29] ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT	name
FROM	Customer
WHERE	custid IN (SELECT custid 
                        FROM Orders);

--[���� 3-30] �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT	name
FROM	Customer
WHERE	custid IN(SELECT	custid
			 FROM		Orders
			 WHERE	bookid IN(SELECT	bookid
						  FROM		Book
						  WHERE	publisher='���ѹ̵��'));

--[���� 3-31] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�. 
SELECT	b1.bookname
FROM	Book b1
WHERE	b1.price > (SELECT 	avg(b2.price)
			    FROM	Book b2
			    WHERE	b2.publisher=b1.publisher);


--[���� 3-32] ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�. 
SELECT	name
FROM	Customer
MINUS
SELECT	name
FROM	Customer
WHERE	custid IN (SELECT custid FROM Orders);

--[���� 3-33] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.

SELECT	name, address
FROM	Customer cs
WHERE	EXISTS (SELECT *
		         FROM	   Orders od
			 WHERE   cs.custid=od.custid);



