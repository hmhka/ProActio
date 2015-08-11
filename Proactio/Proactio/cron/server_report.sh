# *******************************************************************************
# *******************************************************************************
# **                                                                           **
# **                                                                           **
# **  Copyright 2015-2017 JK Technosoft                  					   **
# **  http://www.jktech.com                                           		   **
# **                                                                           **
# **  ProActio is free software; you can redistribute it and/or modify it      **
# **  under the terms of the GNU General Public License (GPL) as published     **
# **  by the Free Software Foundation; either version 2 of the License, or     **
# **  at your option) any later version.                                       **
# **                                                                           **
# **  ProActio is distributed in the hope that it will be useful, but WITHOUT  **
# **  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or    **
# **  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License     **
# **  for more details.                                                        **
# **                                                                           **
# **  See TNC.TXT for more information regarding the Terms and Conditions      **
# **  of use and alternative licensing options for this software.              **
# **                                                                           **
# **  A copy of the GPL is in GPL.TXT which was provided with this package.    **
# **                                                                           **
# **  See http://www.fsf.org for more information about the GPL.               **
# **                                                                           **
# **                                                                           **
# *******************************************************************************
# *******************************************************************************
# 
# Author:
# 
#	JK Technosoft
# 	http://www.jktech.com
#	August 11, 2015
#
# History:
# 
#Source in Proactio environment variables
. `sh /getpath.sh CONFIG`/proactio.profile

SCRIPT_NAME=server_report_drv.p
echo "${DATE}: Server Monitoring Report Generation script started at ${HOSTNAME}" >> ${LOGDIR}/server_reports.log
$DLC/bin/_progres -b -p ${PROGDIR}/${SCRIPT_NAME} >> ${LOGDIR}/server_reports.log
if [ $? -eq "0" ]
then
	echo "${DATE}: Server Monitoring Report Generation script executed successfully on ${HOSTNAME}" >> ${LOGDIR}/server_reports.log
else
	ERRMSG="${DATE}: Errors occurred while executing Server Monitoring Report Generation script on hostname = ${HOSTNAME} : script name = ${SCRIPT_NAME}"
	echo $ERRMSG >> ${LOGDIR}/server_reports.log
	echo $ERRMSG | mailx -s "Proactio Notification Mail" ${EMAIL_LIST}
fi
