package com.springboot.pjt1.product.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.pjt1.repository.dto.BestPrice;
import com.springboot.pjt1.repository.dto.Product;
import com.springboot.pjt1.repository.dto.Review;
import com.springboot.pjt1.repository.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper mapper;
	
	@Override
	public Map<String, Object> searchProductDetail(String name) throws IOException {
		Map<String, Object> map = new HashMap<>();
		map.put("product", selectProductByExactName(name));
		map.put("review", reviewList(name));
		map.put("bestPrice", bestPriceList(name));
		
		return map;
	}
	
	@Override
	public List<Product> searchProduct() {
		return mapper.selectProduct();
	}
	@Override
	public List<Product> searchProductByName(String name) {	// name을 포함한 이름을 가진 모든 product
		return mapper.selectProductByName(name);
	}
	@Override
	public Product selectProductByExactName(String name) {	// 정확히 상품이름이 name인 product
		return mapper.selectProductByExactName(name);
	}
	@Override
	public List<Product> searchProductByCategory(String category) {
		return mapper.selectProductByCategory(category);
	}
	@Override
	public List<Product> selectProductByNameAndCategory(Product product) {
		return mapper.selectProductByNameAndCategory(product);
	}
	
	public List<BestPrice> bestPriceList(String name) throws IOException {
		name = name.replaceAll("\\(", "");
		name = name.replaceAll("\\)", "");
		for (int i = 0; i < name.length(); i++) {
			if(name.charAt(i) >= 48 && name.charAt(i) <= 57) {
				name = name.substring(0, i);
				break;
			}
		}
		System.out.println(name);
		List<BestPrice> list = new ArrayList<>();
		
		// 여기서 쿠팡, 지마켓, 11번가, 티몬, 위메프 최저가 크롤링 결과 map 에 넣기
		{
		// 쿠팡
			Document doc = Jsoup.connect("https://www.coupang.com/np/search?component=&q=" + name + "&filterType=rocket").get();
			Elements products = doc.select("ul#productList li");
			for(Element p : products) {
				if(p.className().contains("search-product__ad-badge")) continue;
				BestPrice bp = new BestPrice();
				bp.setName(p.select("dd.descriptions div.name").text());
				bp.setPrice(p.select("dd.descriptions div.price strong").text());
				bp.setLink("https://www.coupang.com" + p.select("a").attr("href"));
				list.add(bp);
				break;
			}
		}
		{
			// 티몬 아 티몬도 동적이다 망했네 ㅜㅜ
//			Document doc = Jsoup.connect("https://search.tmon.co.kr/search/?keyword=" + name).get();
//			System.out.println(doc.toString());
//			Elements products = doc.select("div.deallist_wrap ul.list li.item");
//			for(Element p : products) {
//				BestPrice bp = new BestPrice();
//				bp.setName(p.select("div.deal_info strong.tx").text());
//				bp.setPrice(p.select("div.deal_info span.sale i.num").text());
//				bp.setLink(p.select("a").attr("href"));
//				list.add(bp);
//				break;
//			}
		}
		{
			// 위메프도 .. 동적....
//			Document doc = Jsoup.connect("https://search.wemakeprice.com/search?search_cate=top&keyword=" + name).get();
//			System.out.println(doc.toString());
		}
		{
			// 지마켓.. 제발
			Document doc = Jsoup.connect("https://browse.gmarket.co.kr/search?keyword=" + name).get();
			Elements products = doc.select("div#section__inner-content-body-container div.box__component");
			for(Element p : products) {
				BestPrice bp = new BestPrice();
				Elements container = p.select("div.box__item-container div.box__information-major");
				System.out.println(container.toString());
				bp.setName(container.select("span.text__brand").text() + " " + container.select("span.text__item").attr("title"));
				bp.setPrice(container.select("div.box__price-seller strong.text__value").text());
				bp.setLink(container.select("a").attr("href"));
				list.add(bp);
				break;
			}
		}
		return list;
	}
	
	@Override
	public List<Review> reviewList(String name) throws IOException {
		
//		System.setProperty("webdriver.chrome.driver", "chromedriver_win32/chromedriver.exe");
//	    WebDriver driver = new ChromeDriver();
//	    driver.get("http://emart.ssg.com/item/itemView.ssg?itemId=1000026680931&siteNo=6001&salestrNo=2034&tlidSrchWd=%EB%A7%A4%EC%9D%BC%EC%9A%B0%EC%9C%A0&srchPgNo=1&src_area=elist");
////	    driver.manage().timeouts().implicitlyWait(5000, TimeUnit.MILLISECONDS);
//		WebElement plz = driver.findElement(By.id("cdtl_cmt_tbody"));
//		
//		System.out.println(plz.toString());
		
		// 여기서 이마트몰 리뷰 크롤링 결과 map 에 넣기
		List<Review> reviews = new ArrayList<>();
//		Document doc = Jsoup.connect(selectProductByExactName(name).getReviewLink()).get();
//		Document doc = Jsoup.connect("https://www.coupang.com/np/search?component=&q=%EB%A7%A4%EC%9D%BC%EC%9A%B0%EC%9C%A0&channel=user").get();
//		System.out.println(doc.toString());
//		Elements tmp = doc.select("div.detailLayout");
//		System.out.println(tmp.get(0));
//		
//		Elements stars = doc.select("tbody#cdtl_cmt_tbody td.star em");
//		System.out.println("stars");
//		System.out.println(stars);
//		Elements comments = doc.select("tbody#cdtl_cmt_tbody td.desc_txt span.desc"); 
//		Elements date = doc.select("tbody#cdtl_cmt_tbody div.date div.in"); 
//		
//		for (int i = 0; i < stars.size(); i++) {
//			Review r = new Review();
//			r.setScore(stars.get(i).toString());
//			r.setComment(comments.get(i).toString());
//			r.setDate(date.get(i).toString());
//			reviews.add(r);
//			System.out.println(r);
//		}
		
		return reviews;
	}
}
