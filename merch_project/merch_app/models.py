from django.db import models
#
# class Employee(models.Model):
#     name = models.CharField(max_length=100)
#     coins = models.IntegerField(default=1000)
#
#     def __str__(self):
#         return self.name

class Merch(models.Model):
    name = models.CharField(max_length=50)
    price = models.IntegerField()

    def __str__(self):
        return self.name
