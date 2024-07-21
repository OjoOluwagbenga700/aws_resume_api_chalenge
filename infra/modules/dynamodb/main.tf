resource "aws_dynamodb_table" "resume_table" {
  name           = var.name_dynamodb
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "resume"

  attribute {
    name = "resume"
    type = "S"
  }
  tags = {
    Name = var.name_dynamodb
  }
}
resource "aws_dynamodb_table_item" "ojo_samuel_resume" {
  table_name = aws_dynamodb_table.resume_table.name
  hash_key   = aws_dynamodb_table.resume_table.hash_key

   item = <<ITEM

{
    "resume": {
      "S": "ojo_samuel_resume"
    },
    "basics": {
      "M": {
        "location": {
          "M": {
            "address": {
              "S": "Federal Housing Estate Lugbe"
            },
            "city": {
              "S": "Abuja"
            },
            "countryCode": {
              "S": "NG"
            },
            "postalCode": {
              "S": "23401"
            },
            "region": {
              "S": "FCT"
            }
          }
        },
        "name": {
          "S": "Ojo Samuel O"
        },
        "phone": {
          "S": "+2348000000055"
        },
        "summary": {
          "S": "A summary of Ojo Samuel's work experience and Certification."
        }
        
      }
    },
   
    "jobExperience": {
      "M": {
        "company": {
          "S": "7Hundred Technologies Ltd."
        },
        "position": {
          "S": "Cloud Engineer"
        },
        "startDate": {
          "S": "2023-01-15"
        },
        "endDate": {
          "S": "till-date"
        },
        "responsibilities": {
          "S": "Developed and maintained web applications, collaborated with cross-functional teams, and optimized performance."
        }
      }
    },
    "certification": {
      "M": {
        "name": {
          "S": "AWS Certified Solutions Architect Associates"
        },
        "institution": {
          "S": "Amazon Web Services"
        },
        "date": {
          "S": "2022"
        },
        "credlyLink": {
          "S": "https://www.credly.com/badges/95281f78-ede8-4112-a348-d39a230320b2/public_url"
        }
      },
     
        "name": {
          "S": "AWS Certified Sysops Administartor Associates"
        },
        "institution": {
          "S": "Amazon Web Services"
        },
        "date": {
          "S": "2023"
        },
        "credlyLink": {
          "S": "https://www.credly.com/badges/ab1d0b6b-09f7-4b2a-9438-503d31b99acb/public_url"
        }
      }  
    }
ITEM
}