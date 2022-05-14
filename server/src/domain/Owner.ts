class Owner {
    public name: String;
    public phone_number: String;
    public email: String;
    public password: String;
    // public created_at: string;

    constructor(name: String, phone_number: String, email: String, password: String, created_at: string=new Date().toISOString()) {
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.password = password;
        // this.created_at = created_at;
    }

}

export default Owner;