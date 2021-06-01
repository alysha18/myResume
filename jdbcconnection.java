import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.ResultSet;

import java.sql.Statement;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import org.openqa.selenium.firefox.FirefoxDriver;;





public class jdbcconnection {

	public static void main(String[] args) throws SQLException {
		
		String host = "localhost";
		String port = "3306";
		Connection con = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/demo?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=CTT\n" + 
				"" , "root", "Www11111"); 

		Statement s = (Statement) con.createStatement();
		ResultSet rs = s.executeQuery("select * from credentials where scenario = 'memo'");
	
	
		while (rs.next()) {
		
			WebDriver driver = new FirefoxDriver();
			driver.get("https://login.salesforce.com/?locale=in");
		driver.findElement(By.xpath("//*[@id=\"username\"]")).sendKeys(rs.getString("username"));
		driver.findElement(By.xpath("//*[@id=\"password\"]")).sendKeys(rs.getString("password"));
		/*System.out.println(rs.getString("password"));*/
		}
	}

}
