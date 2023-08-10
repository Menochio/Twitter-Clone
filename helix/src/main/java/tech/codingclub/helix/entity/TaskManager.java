package tech.codingclub.helix.entity;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

public class TaskManager {

    private int threadCount;
    private ExecutorService executorService;
    public TaskManager(int threadCount){
        this.threadCount = threadCount;
        executorService = Executors.newFixedThreadPool(threadCount);
    }

    public void waitTillQueueIsFreeAndAddTask(Runnable runnable){
        while(getQueueSize()>=threadCount){
            try {
                Thread.currentThread().sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        addTask(runnable);
    }

    public int getQueueSize(){
        ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) (executorService);
        return threadPoolExecutor.getQueue().size();
    }


    public void addTask(Runnable runnable){
        this.executorService.submit(runnable);
    }
}
