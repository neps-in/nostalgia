Front End Level 1

# Written Test


## HTML
--------

1. What is DOCTYPE ? What doctype you would use when you are developing a website

2. Write a HTML Form for Contact Us with the following fields

	2.1 Name
	2.2 Email
	2.3 Sex ()Male / ()Female
	2.4 Customer Type: Landline / Prepaid / Postpaid / Broadband 
	2.5 I have the following queries : (User can select more than one)
		1. Technical Query
		2. Billing 
		3. Accounting
	
	and you need to capture the input in the mysql table.

3. Is the following form is correct if not What are the errors in the following form ?

<form name="form1" action="" method="">
<input type="text" id="name" placeholder="Name" /><br>
<input type="email" id="email" placeholder="Email" /><br>
Sex:<input type="radio" name="sex" value="Male" />Male<br>
<input type="radio" name="sex" value="Female" />Female<br>
Customer Type:<select>
<option>Landline</option>
<option>Prepaid</option>
<option>Postpaid</option>
<option>Broadband</option>
</select><br>
 I have the following queries 
<select name="Query">
  <option value="tech">Technical Query</option>
  <option value="billing">Billing</option>
  <option value="accounting">Accounting</option>
</select>
<input type="button" name="submit" value="Submit"/>

<input type="submit" name="submit" value="Clear"/>


## CSS
------

1. Provide them a moderately complex layout and tell them to create it with CSS
1.1 Have different layout 

2. What is your CSS development workflow 
3. Design a top navbar that should be always fixed as in facebook.

4. What are the various position properties.
5. Replace this logo markup with an image 

	<a href="/" class="logo">Company</a>
6. What is BOX Model 
7. What are SAAS, LESS, Stylus
8. Tell me some of your online goto references.
9. How do you align a div box right.
10. What are sprite and how would you use them.
11. What is the difference between inline, inline-block, and block?
12. How would you go about fixing a CSS issue caused in IE 8 ?
13. How would you make p tag inside the div look green and not the p tag inside 
	without changing the markup

	<div>
		<p> Hello World </p>
		<strong>
			<p> This is a lovely world </p>
		</strong>
	</div>

14. What is the right margin , left margin, bottom margin, top margin in the following CSS Declaration 
	p { 
		margin:0 10px 5px;
	}

	div {
		margin:10px 13px;
	}

15. How would you test crossbrowser compatibility

16. How will you center a div to its container

17. What is CSS Sprite ? Have you used it 

18. Can you use CSS Sprite for an example 

CSS 3 Question

16. Why should we go for CSS 3
17. Develop a callout box without using any images that can fit auto height, auto width and has a max height or max width and that is cross browser compatible with Firefox, Safari, Chrome, IE 7 and above and Opera on all operating systems.

18. Develop a Star without using any images that is crossbrowser compatible






## JavaScript & JQuery

DOM Manipulation

1. How would you change a change the textcolor of text in a div using javascript

2. How would you add Textboxes dynamically to a web page on clicking a button and also you should have

3. a remove button next to the new text box.



OOPS JS

1. How do you create following class in JS 
	
	Class Home {

		properties Address,Height,Width,No.of Persons;

		Functions CreateFloor(ht, wid), CreateWall(ht, wid),

	}

2. How do you extend the class Home to Villa (Villa is subclass of Home )



3. How do you instatiate an array of objects villa, Object House

4. 

1. 	How will you count only element only child nodes of ( Ans: 2 )

	<div id="posts">
	    <!-- some comment -->
	    <!-- another comment -->
	    <div>an element node</div>
	    <!-- another comment -->
	    <span>an element node</span>
	    a text node
	</div>

16. How will you count all the children of a dom element

17. Creat Tabs without using JQUERY

18. Create a Photo Gallery without using JQUERY

19. Design a color picker using HTML, CSS & JS

20. 

## OOPS

1. Assume you are supposed to design object oriented system for a 


1.1	Property Selling Website 
1.2 Social Network
1.3 Website Builder / CMS like wordpress


You are requested to 

Identify Classes, Properties, Methods, 
		 Abstract Classes and their properties and methods , 
		 Interfaces and their member functions	


Performance optimisation tips and techniques
## PHP & MySQL

1. What are PHP Magic Methods, Magic Constants give some examples and their uses

1. Assume you are supposed to design object oriented system for a property selling website. 
   There are different properties like apartment, villa, guest houses. People can visit the 
   website and lookup for information.
   Identify Classes, Properties, Methods, Abstract Classes, Interfaces. 

2. What are the tables you would use for the same 

3. Design complete database schema for a social network like facebook.com assuming you have following features

	1. A user can have unlimited friends
	2. A user can post an update on his wall
	3. A user can control who can see his post, 
		permissions will be 
			1. Only he can see the post
			2. only he & his friends can see the post
			3. only he & his friends & their friends can see the post

	4. A user can make friends by making a request 
	
	What is the reason behind your design decisions ?

	Write the following queries

	1. Display all friends of the given user
	2. Display mutual friends of a given user
	3. Display Friends Of Friend of a given user ( if ravi and guru are friends and guru has friends named austin, mohammed, rama, i should be able display austin, mohammed, rama if i give user id ='ravi')
	
  
2. Have a PHP Script Display the User IP Address
   		


## MySQL

You have the following tables

Purchase order
id, vendor_id , dept_id, vendor_name, purchase_date, Purchase Order #, Date, FromAddress, TotalValue

vendor
id, vendor_name, vendor_address

department 
id, department_name, dept_head

Write a SQL Query to perform the following

1. Create Purchase order table, vendor, department

2. Assume you have forgotten to add few fields like total value, fromaddress, and you need to 
remove a field vendor_name.

3. Creat a user and give him access to perform operations on the table.

3. Create Table index for the prim

4. List all Purchase order #, vendor_name, Vendor_address, department_name, total value whose total value is more than 10,000 and between the 11th Nov 2013 To 11th Dec 2013. 

List all the vendor name, vendor_address that has the word 'go' it should display 

govindan
ramgopal
caligo

3. Design complete database schema for a social network like facebook.com assuming you have following features

	1. A user can have unlimited friends
	2. A user can post an update on his wall
	3. A user can control who can see his post, 
		permissions will be 
			1. Only he can see the post
			2. only he & his friends can see the post
			3. only he & his friends & their friends can see the post

	4. A user can make friends by making a request 
	
	What is the reason behind your design decisions ?

	Write the following queries

	1. Display all friends of the given user
	2. Display mutual friends of a given user
	3. Display Friends Of Friend of a given user ( if ravi and guru are friends and guru has friends named austin, mohammed, rama, i should be able display austin, mohammed, rama if i give user id ='ravi')

## Creativity Test

	1. Tell me some of the features that you would have in an application like

		1. Editor
		2. Social Network
		3. Programming / Non Programming Q&A Site like Quora.com
		4. Video blogging Site

Design Pattern

1. Develop an implementation of singleton design pattern in php / javascript ?

2. Develop an implementation of factory pattern in php / javascript ?


## General Questions


What are the tech blogs that you read / look for refrence / regularly

Whom are the tech celebrities that you know 


Algorithm & Data Structure

1. Design and Implement Quick Sort Algorithm and analyse the time complexity and space complexity of the same.

2. Write a function isPrime( int n ) takes an integer as an input and return true if it is prime and return false if it is not. And analyse its time and space complexity

3. Write a function printAllPrime( int n ) takes an integer as an input and prints all the prime numbers less than n. And analyse its time and space complexity.



F2F

1. What happens between the time you type www.google.com or www.abc.com and hit enter and 
you see the web page

2. What is https ? Have you worked on HTTPS ? How will you make your website as a HTTPS Site

3. Have you worked on GIT ? What is the GIT Work Flow that you use

4. 

