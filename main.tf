module "policy" {
  source = "./policy"
 

}
module "alert" {
  source = "./alert"
  policy_id1 =module.policy.policy_id
 
}
module "workflow" {
  source = "./workflow"
  channel_id1=module.alert.email_channel_id
  
}