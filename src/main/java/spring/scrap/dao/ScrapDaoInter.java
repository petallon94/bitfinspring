package spring.scrap.dao;

import java.util.List;

import spring.dto.ScrapDto;

public interface ScrapDaoInter {
	public int getNumMax();
	public int getTotalCount(String smidnum);
	public List<ScrapDto> getScrapList(int start, int perpage);
	public ScrapDto getScrapData(String num);
	public void deleteCardScrap(ScrapDto dto);
	public void insertScrap(ScrapDto dto);
	public int cardScrapCheck(String scnum, String smidnum);
	public int boardScrapCheck(String sbnum, String smidnum);
	public ScrapDto getCardData(String scnum);
}
