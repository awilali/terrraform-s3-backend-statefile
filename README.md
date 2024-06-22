<b><h3>State file is very important for Terraform.</b></h3>
The state file is a JSON representation of the infrastructure you have deployed in the cloud.

There are 3 different ways to store the state file. 

1. Enhanced Backend – Local <br>
2. Enhanced Backend – Remote in Terraform Cloud <br> 
3. Standard Backend – (S3 Bucket, Azure storage, GCP storage) <br> <br>

# 1. Enhanced Backend – Local <br>

When running Terraform locally, the state is stored locally in your system by default, in your current working directory as <b>terraform.tfstate</b>.
It is optional to add the following backend code to the terraform/provider block:

<b>
terraform { <br>
&nbsp; &nbsp; &nbsp; &nbsp; backend "local" { <br> 
&nbsp; &nbsp; &nbsp; &nbsp; path = "terraform.tfstate" <br> 
 &nbsp; &nbsp; } <br>
} 
</b> 

<br><br>

# 2. Enhanced Backend – Remote

The state file can also be stored in Terraform Cloud: <br>

<b>
terraform { <br>
&nbsp; &nbsp; &nbsp; &nbsp; backend "remote" { <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; organization = "cambaabur" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; workspaces { <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name = "dev" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
}<br></b>

<br> <br>

# 3. Standard Backend – (S3 Bucket, Azure storage, GCP storage)

You have also the option to store the Terraform state file in an external storage such as an S3 in our example:

<br>
<b>
  
terraform { <br>
&nbsp; &nbsp; &nbsp; &nbsp; backend "s3" { <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bucket = "hafs" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dynamodb_table = "state-lock" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; key = "global/mystatefile/terrafor.tfstate" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; region = "us-east-2" <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;encrypt = true <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }     
} <br></b>
