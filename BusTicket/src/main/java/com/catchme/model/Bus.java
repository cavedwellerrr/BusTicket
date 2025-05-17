package com.catchme.model;

public class Bus {
    private int busId;
    private String plateNo;
    private String seats;
    private int seatAvailable;
    private String deptTime;
    private String arrTime;
    private String route;
    private double pricePerSeat;  

    public Bus() {}

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getPlateNo() {
        return plateNo;
    }

    public void setPlateNo(String plateNo) {
        this.plateNo = plateNo;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public int getSeatAvailable() {
        return seatAvailable;
    }

    public void setSeatAvailable(int seatAvailable) {
        this.seatAvailable = seatAvailable;
    }

    public String getDeptTime() {
        return deptTime;
    }

    public void setDeptTime(String deptTime) {
        this.deptTime = deptTime;
    }

    public String getArrTime() {
        return arrTime;
    }

    public void setArrTime(String arrTime) {
        this.arrTime = arrTime;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public double getPricePerSeat() {
        return pricePerSeat;
    }

    public void setPricePerSeat(double pricePerSeat) {
        this.pricePerSeat = pricePerSeat;
    }
}
