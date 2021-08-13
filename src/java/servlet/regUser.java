package servlet;


public class regUser {
    private int Id;
    private String Name;
    private String password;
    private String Email;
    private int DOBDay;
    private String DOBMonth;
    private int DOBYear;
    private String Gender;
    private String status;
    private String imagePath;
    private String contact;
    private String bio; 

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public regUser(int Id, String Name, String password, String Email, int DOBDay, String DOBMonth, int DOBYear, String Gender, String status, String contact, String bio) {
        this.Id = Id;
        this.Name = Name;
        this.password = password;
        this.Email = Email;
        this.DOBDay = DOBDay;
        this.DOBMonth = DOBMonth;
        this.DOBYear = DOBYear;
        this.Gender = Gender;
        this.status = status;
        this.contact = contact;
        this.bio = bio;
    }

    public regUser(int Id) {
        this.Id = Id;
    }

    public regUser(int Id, String Name, String password, String Email, int DOBDay, String DOBMonth, int DOBYear, String Gender, String status, String imagePath) {
        this.Id = Id;
        this.Name = Name;
        this.password = password;
        this.Email = Email;
        this.DOBDay = DOBDay;
        this.DOBMonth = DOBMonth;
        this.DOBYear = DOBYear;
        this.Gender = Gender;
        this.status = status;
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public int getDOBDay() {
        return DOBDay;
    }

    public void setDOBDay(int DOBDay) {
        this.DOBDay = DOBDay;
    }

    public String getDOBMonth() {
        return DOBMonth;
    }

    public void setDOBMonth(String DOBMonth) {
        this.DOBMonth = DOBMonth;
    }

    public int getDOBYear() {
        return DOBYear;
    }

    public void setDOBYear(int DOBYear) {
        this.DOBYear = DOBYear;
    }

    public int getId() {
        return Id;
    }

    public regUser(int Id, String Name, String password, String Email, int DOBDay, String DOBMonth, int DOBYear, String Gender) {
        this.Id = Id;
        this.Name = Name;
        this.password = password;
        this.Email = Email;
        this.DOBDay = DOBDay;
        this.DOBMonth = DOBMonth;
        this.DOBYear = DOBYear;
        this.Gender = Gender;
    }

    public regUser(int Id, String Name, String password, String Email, int DOBDay, String DOBMonth, int DOBYear, String Gender, String status) {
        this.Id = Id;
        this.Name = Name;
        this.password = password;
        this.Email = Email;
        this.DOBDay = DOBDay;
        this.DOBMonth = DOBMonth;
        this.DOBYear = DOBYear;
        this.Gender = Gender;
        this.status = status;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

   

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public regUser(String Name, String password) {
        this.Name = Name;
        this.password = password;
    }

    public regUser(String Name) {
        this.Name = Name;
    }

  

   
    
    
    
    
    
    
}
