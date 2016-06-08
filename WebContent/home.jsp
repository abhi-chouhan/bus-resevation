<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import ="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head runat="server"><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
   <title>Demo Seat Reservation with jQuery</title>
    <script src="JS/ca-pub-0617840233982627.js"></script>
    <script type="text/javascript" async="" src="JS/ga.js"></script>
    <script src="JS/jquery-1.4.1.min.js" type="text/javascript"></script>
  
	<style type="text/css">
#holder{	
	 height:200px;	 
	 width:550px;
	 background-color:#F5F5F5;
	 border:1px solid #A4A4A4;
	 margin-left:10px;	
	}
	 #place {
	 position:relative;
	 margin:7px;
	 }
     #place a{
	 font-size:0.6em;
	 }
     #place li
     {
         list-style: none outside none;
         position: absolute;   
     }    
     #place li:hover
     {
        background-color:yellow;      
     } 
	 #place .seat{
	 background:url("images/available_seat_img.gif") no-repeat scroll 0 0 transparent;
	 height:33px;
	 width:33px;
	 display:block;	 
	 }
      #place .selectedSeat
      { 
		background-image:url("images/booked_seat_img.gif");      	 
      }
	   #place .selectingSeat
      { 
		background-image:url("images/selected_seat_img.gif");      	 
      }
	  #place .row-3, #place .row-4{
		margin-top:10px;
	  }
	 #seatDescription{
	 padding:0px;
	 }
	  #seatDescription li{
	  verticle-align:middle;	  
	  list-style: none outside none;
	   padding-left:35px;
	  height:35px;
	  float:left;
	  }
</style>
	
	</head>

<body>
   

<h2 style="font-size:1.2em;"> Choose seats by clicking the corresponding seat in the layout below:</h2>

 <%
String s1="";
String source=request.getParameter("source");
String destination=request.getParameter("destination");
System.out.println(source);
System.out.println(destination);



String busid=request.getParameter("busid");
 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");
			PreparedStatement ps=con.prepareStatement("select * from busticket where busid=? ");
		ps.setString(1,busid);
	ResultSet  rs=	ps.executeQuery();
String[] val = new String [20];

int i=0;
	while(rs.next())
{
	val[i]=rs.getString(5);

System.out.println(val[i]);
i++;
		}
 StringBuffer sb = new StringBuffer("[");
for(int j=0;j<val.length;j++)
{
if(val[j]!=null)
{
sb=sb.append(val[j]);
sb=sb.append(",");
}
}
sb=sb.append("]");
int len=sb.length();
String s=sb.substring(0,sb.length()-2);
s1=s.concat("]");
System.out.println(s1.toString());
}
		catch(Exception e)
		{
			System.out.println(e);
		} %>

<h4>Source : <%= source %> </h4>   <h4>Destination  : " <%= destination %> </h4>
       <div id="holder"> 
		<ul id="place"><li class="seat row-0 col-0" style="top:0px;left:0px"><a title="1">1</a></li><li class="seat row-0 col-1" style="top:0px;left:35px"><a title="6">6</a></li><li class="seat row-0 col-2" style="top:0px;left:70px"><a title="11">11</a></li><li class="seat row-0 col-3" style="top:0px;left:105px"><a title="16">16</a></li><li class="seat row-0 col-4" style="top:0px;left:140px"><a title="21">21</a></li><li class="seat row-0 col-5" style="top:0px;left:175px"><a title="26">26</a></li><li class="seat row-0 col-6 selectingSeat" style="top:0px;left:210px"><a title="31">31</a></li><li class="seat row-0 col-7" style="top:0px;left:245px"><a title="36">36</a></li><li class="seat row-0 col-8 selectingSeat" style="top:0px;left:280px"><a title="41">41</a></li><li class="seat row-0 col-9" style="top:0px;left:315px"><a title="46">46</a></li><li class="seat row-0 col-10" style="top:0px;left:350px"><a title="51">51</a></li><li class="seat row-0 col-11" style="top:0px;left:385px"><a title="56">56</a></li><li class="seat row-0 col-12" style="top:0px;left:420px"><a title="61">61</a></li><li class="seat row-0 col-13" style="top:0px;left:455px"><a title="66">66</a></li><li class="seat row-0 col-14" style="top:0px;left:490px"><a title="71">71</a></li><li class="seat row-1 col-0" style="top:35px;left:0px"><a title="2">2</a></li><li class="seat row-1 col-1" style="top:35px;left:35px"><a title="7">7</a></li><li class="seat row-1 col-2" style="top:35px;left:70px"><a title="12">12</a></li><li class="seat row-1 col-3" style="top:35px;left:105px"><a title="17">17</a></li><li class="seat row-1 col-4" style="top:35px;left:140px"><a title="22">22</a></li><li class="seat row-1 col-5" style="top:35px;left:175px"><a title="27">27</a></li><li class="seat row-1 col-6" style="top:35px;left:210px"><a title="32">32</a></li><li class="seat row-1 col-7" style="top:35px;left:245px"><a title="37">37</a></li><li class="seat row-1 col-8" style="top:35px;left:280px"><a title="42">42</a></li><li class="seat row-1 col-9 selectingSeat" style="top:35px;left:315px"><a title="47">47</a></li><li class="seat row-1 col-10" style="top:35px;left:350px"><a title="52">52</a></li><li class="seat row-1 col-11" style="top:35px;left:385px"><a title="57">57</a></li><li class="seat row-1 col-12" style="top:35px;left:420px"><a title="62">62</a></li><li class="seat row-1 col-13" style="top:35px;left:455px"><a title="67">67</a></li><li class="seat row-1 col-14" style="top:35px;left:490px"><a title="72">72</a></li><li class="seat row-2 col-0" style="top:70px;left:0px"><a title="3">3</a></li><li class="seat row-2 col-1" style="top:70px;left:35px"><a title="8">8</a></li><li class="seat row-2 col-2" style="top:70px;left:70px"><a title="13">13</a></li><li class="seat row-2 col-3" style="top:70px;left:105px"><a title="18">18</a></li><li class="seat row-2 col-4" style="top:70px;left:140px"><a title="23">23</a></li><li class="seat row-2 col-5" style="top:70px;left:175px"><a title="28">28</a></li><li class="seat row-2 col-6" style="top:70px;left:210px"><a title="33">33</a></li><li class="seat row-2 col-7" style="top:70px;left:245px"><a title="38">38</a></li><li class="seat row-2 col-8" style="top:70px;left:280px"><a title="43">43</a></li><li class="seat row-2 col-9" style="top:70px;left:315px"><a title="48">48</a></li><li class="seat row-2 col-10 selectingSeat" style="top:70px;left:350px"><a title="53">53</a></li><li class="seat row-2 col-11" style="top:70px;left:385px"><a title="58">58</a></li><li class="seat row-2 col-12" style="top:70px;left:420px"><a title="63">63</a></li><li class="seat row-2 col-13" style="top:70px;left:455px"><a title="68">68</a></li><li class="seat row-2 col-14" style="top:70px;left:490px"><a title="73">73</a></li><li class="seat row-3 col-0" style="top:105px;left:0px"><a title="4">4</a></li><li class="seat row-3 col-1" style="top:105px;left:35px"><a title="9">9</a></li><li class="seat row-3 col-2" style="top:105px;left:70px"><a title="14">14</a></li><li class="seat row-3 col-3" style="top:105px;left:105px"><a title="19">19</a></li><li class="seat row-3 col-4" style="top:105px;left:140px"><a title="24">24</a></li><li class="seat row-3 col-5" style="top:105px;left:175px"><a title="29">29</a></li><li class="seat row-3 col-6 selectingSeat" style="top:105px;left:210px"><a title="34">34</a></li><li class="seat row-3 col-7" style="top:105px;left:245px"><a title="39">39</a></li><li class="seat row-3 col-8" style="top:105px;left:280px"><a title="44">44</a></li><li class="seat row-3 col-9 selectingSeat" style="top:105px;left:315px"><a title="49">49</a></li><li class="seat row-3 col-10" style="top:105px;left:350px"><a title="54">54</a></li><li class="seat row-3 col-11" style="top:105px;left:385px"><a title="59">59</a></li><li class="seat row-3 col-12" style="top:105px;left:420px"><a title="64">64</a></li><li class="seat row-3 col-13" style="top:105px;left:455px"><a title="69">69</a></li><li class="seat row-3 col-14" style="top:105px;left:490px"><a title="74">74</a></li><li class="seat row-4 col-0 selectedSeat" style="top:140px;left:0px"><a title="5">5</a></li><li class="seat row-4 col-1 selectedSeat" style="top:140px;left:35px"><a title="10">10</a></li><li class="seat row-4 col-2" style="top:140px;left:70px"><a title="15">15</a></li><li class="seat row-4 col-3" style="top:140px;left:105px"><a title="20">20</a></li><li class="seat row-4 col-4 selectedSeat" style="top:140px;left:140px"><a title="25">25</a></li><li class="seat row-4 col-5" style="top:140px;left:175px"><a title="30">30</a></li><li class="seat row-4 col-6 selectingSeat" style="top:140px;left:210px"><a title="35">35</a></li><li class="seat row-4 col-7" style="top:140px;left:245px"><a title="40">40</a></li><li class="seat row-4 col-8" style="top:140px;left:280px"><a title="45">45</a></li><li class="seat row-4 col-9 selectingSeat" style="top:140px;left:315px"><a title="50">50</a></li><li class="seat row-4 col-10" style="top:140px;left:350px"><a title="55">55</a></li><li class="seat row-4 col-11" style="top:140px;left:385px"><a title="60">60</a></li><li class="seat row-4 col-12" style="top:140px;left:420px"><a title="65">65</a></li><li class="seat row-4 col-13" style="top:140px;left:455px"><a title="70">70</a></li><li class="seat row-4 col-14" style="top:140px;left:490px"><a title="75">75</a></li></ul>    
	</div>
	 <div style="width:600px;text-align:center;overflow:auto"> 
	<ul id="seatDescription">
<li style="background:url(&#39;images/available_seat_img.gif&#39;) no-repeat scroll 0 0 transparent;">Available Seat</li>
<li style="background:url(&#39;images/booked_seat_img.gif&#39;) no-repeat scroll 0 0 transparent;">Booked Seat</li>
<li style="background:url(&#39;images/selected_seat_img.gif&#39;) no-repeat scroll 0 0 transparent;">Selected Seat</li>
	</ul>        </div>
	
	<div style="width:580px;text-align:left;margin:5px">	
	
		<input type="hidden" value="<%= source %>" name="source">
		<input type="submit" id="btnShowNew" value="Show Selected Seats" name="X">
          </div>


    </form>
    
     <script type="text/javascript">
    

   var bookedSeats = <%=   s1  %>;
    var source= <%= s1  %>
  
        $(function () {
        	
           
            var settings = {
                rows: 2,
                cols: 5,
                rowCssPrefix: 'row-',
                colCssPrefix: 'col-',
                seatWidth: 35,
                seatHeight: 35,
                seatCss: 'seat',
                selectedSeatCss: 'selectedSeat',
				selectingSeatCss: 'selectingSeat'
            };

            var init = function (reservedSeat) {
                var str = [], seatNo, className;
                for (i = 0; i < settings.rows; i++) {
                    for (j = 0; j < settings.cols; j++) {
                        seatNo = (i + j * settings.rows + 1);
                        className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                        if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                            className += ' ' + settings.selectedSeatCss;
                        }
                        str.push('<li class="' + className + '"' +
                                  'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                                  '<a title="' + seatNo + '">' + seatNo + '</a>' +
                                  '</li>');
                    }
                }
                $('#place').html(str.join(''));
            };

            //case I: Show from starting
            //init();

            //Case II: If already booked
            
            
           
         
       
          
         
            init(bookedSeats);


            $('.' + settings.seatCss).click(function () {
			if ($(this).hasClass(settings.selectedSeatCss)){
				alert('This seat is already reserved');
			}
			else{
                $(this).toggleClass(settings.selectingSeatCss);
				}
            });

            $('#btnShow').click(function () {
                var str = [];
             
               
                $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.'+ settings.selectingSeatCss + ' a'), function (index, value) {
                    str.push($(this).attr('title'));
                });
             
                
                var k=(str.join(','));
                window.location = "http://localhost:8080/BusClub/f.html";
                alert(k);
               
              
            })

            $('#btnShowNew').click(function () {
                var str = [], item;
                $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
                    item = $(this).attr('title');                   
                    str.push(item);                   
                });
                var k=str.join(',');
                window.location = "myservlet?k="+k
                alert(k);
              
            })
        });
     
        
    </script>

    


   

</body></html>