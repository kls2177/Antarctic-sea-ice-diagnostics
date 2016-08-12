#calcSIE.py
#This package calculates sea ice extent from global climate model output of sea ice fraction
#Written by: Karen L. Smith
#Date: 08/12/2016


#load packages
import numpy as np


def gridArea(lat,lon):
    """Calculates area of each GCM grid cell

    Args:
        Latitude
        Longitude

    Returns:
        Grid cell area as a function of (lat,lon)
    """
    
    radius_earth = 6.37122e6 #in metres
    tarea = np.zeros((len(lat),len(lon)))
    
    for i in range(1,len(lat)):
        for j in range(len(lon)-1):
            dlat1 = lat[i-1]
            dlat2 = lat[i]
            dlatrad1 = (np.pi/180)*dlat1 + np.pi/2
            dlatrad2 = (np.pi/180)*dlat2 + np.pi/2
            dlon = (lon[j+1] - lon[j])
            dlonrads = (np.pi/180)*dlon
            tarea[i,j] = ((radius_earth)**2)*(np.cos(dlatrad1) - np.cos(dlatrad2))*dlonrads
           
    tarea[:,len(lon)-1] = tarea[:,len(lon)-2]
    
    return tarea



def calcSIE(var,lat,lon):
    """Calculate Sea Ice Extent from sea ice fraction

    Args:
        Sea ice fraction as a function of (year,day/month,lat,lon)
        Latitude
        Longitude

    Returns:
        Sea ice extent as a function of (year,day/month)
    """
    
    #mask values less than 15% sea ice fraction and set remaining values to one
    var = np.ma.masked_less(var,0.15)
    var[~var.mask]=1
    dims = var.shape

    #get grid cell areas
    tarea = gridArea(lat,lon)
    
    sie = np.zeros((dims[0],dims[1]))
    sie_tmp1 = np.zeros((dims[2],dims[3]))
    for i in range(dims[0]):
        for j in range(dims[1]):
            sie_tmp1[:,:] = np.squeeze(var[i,j,:,:])*tarea[:,:]
            sie_tmp2 = np.sum(sie_tmp1)
            sie[i,j] = sie_tmp2
            
    return sie
