public with sharing class BusScheduleCache {

    private Cache.OrgPartition part;

    public BusScheduleCache() {
        Cache.OrgPartition initPart = Cache.Org.getPartition('local.BusSchedule');
        if (initPart != null){
            part = initPart;
        }
    }

    public void putSchedule(String busLine, Time[] schedule) {
//Implement the putSchedule() method so that it stores the passed-in values in the org cache by using the partition class variable (part).
if (part != null){
    part.put(busLine,schedule);
}

    }

    public Time[] getSchedule(String busLine) {
    Time[] bSched = new Time[]{};
    if (part != null && (Time[])part.get(busLine) != null){
        bSched = (Time[])part.get(busLine);        
    } else{
        bSched.add(Time.newInstance(8,0,0,0));
        bSched.add(Time.newInstance(17,0,0,0));
    }
    return bSched;
}
    }
