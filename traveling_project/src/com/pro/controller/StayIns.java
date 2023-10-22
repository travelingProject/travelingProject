package com.pro.controller;

import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pro.dto.StayInfo;
import com.pro.mybatis.StayInsert;

public class StayIns implements ControlQuery {
	
	static StayIns dbi = new StayIns();
	
	public static StayIns instance() {
		return dbi;
	}

	@Override
	public String dataCon(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		HttpSession session = rq.getSession();
		String uploadPath = rq.getRealPath("/stay_images");
		int size = 10 * 1024 * 1024;
		String hostId = (String) session.getAttribute("id");
		String stayName = "";
		String latitude = "";
		String longitude = "";
		String postCode = "";
		String roadAddr = "";
		String jibunAddr = "";
		String detailAddr = "";
		String referenceAddr = "";
		String hostPhone = "";
		String content = "";
		
		// 이미지
		String imagename1 = "";
		String imagename2 = "";
		String imagename3 = "";
		String imagename4 = "";
		String imagename5 = "";
		String origimageename1 = "";
		String origimageename2 = "";
		String origimageename3 = "";
		String origimageename4 = "";
		String origimageename5 = "";
		
		// 편의 시설
		String tub = "";
		String bathSupplies = "";
		String hairDryer = "";
		String towel = "";
		String bedding = "";
		String washingMachine = "";
		String dryingMachine = "";
		String pool = "";
		String arcadeGame = "";
		String gym = "";
		String tv = "";
		String boardGame = "";
		String airConditioner = "";
		String fan = "";
		String heatingSystem = "";
		String carbonMonoxideAlarm = "";
		String fireExtinguisher = "";
		String aidKit = "";
		String fireAlarm = "";
		String workspace = "";
		String wirelessInternet = "";
		String barbecueTool = "";
		String basicCookware = "";
		String diningTable = "";
		String cutlery = "";
		String refrigerator = "";
		String microwave = "";
		String electricRiceCooker = "";
		String gasStoveOrInduction = "";
		String electricVehicleChargingFacilities = "";
		String parkingLot = "";

		try {
			MultipartRequest multi = new MultipartRequest(rq, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			stayName = multi.getParameter("name");
			latitude = multi.getParameter("latitude");
			longitude = multi.getParameter("longitude");
			postCode = multi.getParameter("post_code");
			roadAddr = multi.getParameter("road_addr");
			jibunAddr = multi.getParameter("jibun_addr");
			detailAddr = multi.getParameter("detail_addr");
			referenceAddr = multi.getParameter("reference_addr");
			hostPhone = multi.getParameter("host_phone");
			content = multi.getParameter("content");
			imagename1 = multi.getParameter("image1");
			imagename2 = multi.getParameter("image2");
			imagename3 = multi.getParameter("image3");
			imagename4 = multi.getParameter("image4");
			imagename5 = multi.getParameter("image5");
			tub = multi.getParameter("tub");
			bathSupplies = multi.getParameter("bath_supplies");
			hairDryer = multi.getParameter("hair_dryer");
			towel = multi.getParameter("towel");
			bedding = multi.getParameter("bedding");
			washingMachine = multi.getParameter("washing_machine");
			dryingMachine = multi.getParameter("drying_machine");
			pool = multi.getParameter("pool");
			arcadeGame = multi.getParameter("arcade_game");
			gym = multi.getParameter("gym");
			tv = multi.getParameter("tv");
			boardGame = multi.getParameter("board_game");
			airConditioner = multi.getParameter("air_conditioner");
			fan = multi.getParameter("fan");
			heatingSystem = multi.getParameter("heating_system");
			carbonMonoxideAlarm = multi.getParameter("carbon_monoxide");
			fireExtinguisher = multi.getParameter("fire_extinguisher");
			aidKit = multi.getParameter("aid_kit");
			fireAlarm = multi.getParameter("fire_alarm");
			workspace = multi.getParameter("workspace");
			wirelessInternet = multi.getParameter("wireless_internet");
			barbecueTool = multi.getParameter("barbecue_tool");
			basicCookware = multi.getParameter("basic_cookware");
			diningTable = multi.getParameter("dinning_table");
			cutlery = multi.getParameter("cutlery");
			refrigerator = multi.getParameter("refrigerator");
			microwave = multi.getParameter("microwave");
			electricRiceCooker = multi.getParameter("elecTric_rice_cooker");
			gasStoveOrInduction = multi.getParameter("gas_stove_or_induction");
			electricVehicleChargingFacilities = multi.getParameter("electric_vehicle");
			parkingLot = multi.getParameter("parking_lot");	

			// 이미지 업로드
			String image1 = (String) files.nextElement();
			imagename1 = multi.getFilesystemName(image1);
			origimageename1 = multi.getOriginalFileName(image1);

			String image2 = (String) files.nextElement();
			imagename2 = multi.getFilesystemName(image2);
			origimageename2 = multi.getOriginalFileName(image2);

			String image3 = (String) files.nextElement();
			imagename3 = multi.getFilesystemName(image3);
			origimageename3 = multi.getOriginalFileName(image3);

			String image4 = (String) files.nextElement();
			imagename4 = multi.getFilesystemName(image4);
			origimageename4 = multi.getOriginalFileName(image4);

			String image5 = (String) files.nextElement();
			imagename5 = multi.getFilesystemName(image5);
			origimageename5 = multi.getOriginalFileName(image5);
		} catch (Exception e) {
			e.printStackTrace();
		}		

		rs.setCharacterEncoding("UTF-8");
		StayInsert insert = new StayInsert();
		StayInfo stayInfo = new StayInfo();
		stayInfo.setHostId(hostId);
		stayInfo.setStayName(stayName);
		stayInfo.setLat(latitude);
		stayInfo.setLngt(longitude);
		stayInfo.setPostCode(postCode);
		stayInfo.setRoadAddr(roadAddr);
		stayInfo.setJibunAddr(jibunAddr);
		stayInfo.setDetailAddr(detailAddr);
		stayInfo.setReferenceAddr(referenceAddr);
		stayInfo.setHostPhone(hostPhone);
		
		// 이미지
		stayInfo.setImage1(imagename1);
		stayInfo.setImage2(imagename2);
		stayInfo.setImage3(imagename3);
		stayInfo.setImage4(imagename4);
		stayInfo.setImage5(imagename5);
		
		// 편의 시설
		stayInfo.setTub(tub);
		stayInfo.setBathSupplies(bathSupplies);
		stayInfo.setHairDryer(hairDryer);
		stayInfo.setTowel(towel);
		stayInfo.setBedding(bedding);
		stayInfo.setWashingMachine(washingMachine);
		stayInfo.setDryingMachine(dryingMachine);
		stayInfo.setPool(pool);
		stayInfo.setArcadeGame(arcadeGame);
		stayInfo.setGym(gym);
		stayInfo.setTv(tv);
		stayInfo.setBoardGame(boardGame);
		stayInfo.setAirConditioner(airConditioner);
		stayInfo.setFan(fan);
		stayInfo.setHeatingSystem(heatingSystem);
		stayInfo.setCarbonMonoxideAlarm(carbonMonoxideAlarm);
		stayInfo.setFireExtinguisher(fireExtinguisher);
		stayInfo.setAidKit(aidKit);
		stayInfo.setFireAlarm(fireAlarm);
		stayInfo.setWorkspace(workspace);
		stayInfo.setWirelessInternet(wirelessInternet);
		stayInfo.setBarbecueTool(barbecueTool);
		stayInfo.setBasicCookware(basicCookware);
		stayInfo.setDiningTable(diningTable);
		stayInfo.setCutlery(cutlery);
		stayInfo.setRefrigerator(refrigerator);
		stayInfo.setMicrowave(microwave);
		stayInfo.setElectricRiceCooker(electricRiceCooker);
		stayInfo.setGasStoveOrInduction(gasStoveOrInduction);
		stayInfo.setElectricVehicleChargingFacilities(electricVehicleChargingFacilities);
		stayInfo.setParkingLot(parkingLot);
		stayInfo.setContent(content);
		insert.dbInsert(stayInfo);
		// TODO Auto-generated method stub
		return null;
	}
}
