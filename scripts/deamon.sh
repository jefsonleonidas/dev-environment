#!/bin/bash
 
principal()
{
	executa
	principal
}

executa()
{
	testa
}

testa()
{
	ps ax | grep java -jar /opt/ConsciusKeyGenerator.jar
	if [$? -eq 0]
	then
		exit
	else
		java -jar /opt/ConsciusKeyGenerator.jar
	fi
}

principal