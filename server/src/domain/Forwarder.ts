class Forwarder {
    public name: String;
    public phone_number: String;
    public email: String;
    public password: String;
    public corporation_name: String;
    public corporation_number: String;

    constructor(name: String, phone_number: String, email: String, password: String, corporation_name: String, corporation_num: String) {
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.password = password;
        this.corporation_name = corporation_name;
        this.corporation_number = corporation_num;

    }

}

export default Forwarder;