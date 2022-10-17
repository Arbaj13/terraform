resource "aws_key_pair" "key" {
    key_name= "vprofile"
    public_key = file(var.pubkey)
  
}