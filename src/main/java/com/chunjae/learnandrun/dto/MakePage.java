package com.chunjae.learnandrun.dto;

public class MakePage {
    private int currPage;
    private int totalCount;
    private int pageSize;
    private int blockSize;
    private int totalPage;
    private int startRow;
    private int startBlock;
    private int endBlock;
    private boolean prev;
    private boolean next;

    public MakePage(int currPage, int totalCount, int pageSize, int blockSize) {
        this.currPage = currPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.blockSize = blockSize;

        makeTotalPage();
        makeStartRow();
        makeBlock();
        makePrevNext();
    }

    /** totalPage */
    private void makeTotalPage(){
        totalPage=(int)Math.ceil(totalCount/(double)pageSize);
    }

    /** startRow */
    private void makeStartRow(){
        startRow=(currPage-1)*pageSize;
    }

    /** startBlock, endBlock */
    private void makeBlock(){
        startBlock=((currPage-1)/blockSize)*blockSize+1;
        endBlock=startBlock+blockSize-1;
        if(endBlock>totalPage)
            endBlock=totalPage;
    }

    /** prev, next */
    private void makePrevNext(){
        prev=(startBlock!=1)? true:false;
        next=(endBlock==totalPage)? false:true;
    }

    public int getCurrPage() {
        return currPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getStartRow() {
        return startRow;
    }

    public int getStartBlock() {
        return startBlock;
    }

    public int getEndBlock() {
        return endBlock;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }
}
