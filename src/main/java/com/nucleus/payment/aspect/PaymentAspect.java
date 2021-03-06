package com.nucleus.payment.aspect;

import com.nucleus.payment.model.Payment;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Aspect
public class PaymentAspect {
    Logger log = LoggerFactory.getLogger(PaymentAspect.class);

    @Pointcut("execution (* com.nucleus.payment.service.*.*(..))")
    public void pointCutBefore(){

    }

    @Before("pointCutBefore()")
    public void logBefore(JoinPoint joinPoint){
        log.info("-------------------------------------------------------------------------");
        log.info("PaymentLogBefore "+joinPoint.getSignature().getName()+" is being executed");
        log.info("-------------------------------------------------------------------------");
    }

    @AfterReturning(value = "pointCutBefore()", returning = "status")
    public void logAfter(JoinPoint joinPoint, Object status){
        if(status instanceof List){
            log.info("-------------------------------------------------------------------------");
            log.info("PaymentLogAfter "+joinPoint.getSignature().getName()+
                    " payment "+((List<?>) status).size());
            log.info("-------------------------------------------------------------------------");
        }
        else if (status instanceof Payment){
            log.info("-------------------------------------------------------------------------");
            log.info("PaymentLogAfter "+joinPoint.getSignature().getName()+
                    " payment "+((Payment) status).getLoanApplicationNumber());
            log.info("-------------------------------------------------------------------------");
        }
        else{
            Boolean successOrFaliure = (Boolean) status;
            log.info("-------------------------------------------------------------------------");
            log.info("PaymentLogAfter "+joinPoint.getSignature().getName()+" success "+successOrFaliure);
            log.info("-------------------------------------------------------------------------");
        }
    }
}
