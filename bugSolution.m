The solution involves using the `performBlock:` or `performBlockAndWait:` methods of the `NSManagedObjectContext` to ensure that all operations on the context are performed on the correct thread.

```objectivec
// Correct - Using performBlock: to ensure thread safety
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
    [self.managedObjectContext performBlock:^{ 
        // Access and modify managed objects here
    }];
});
```

Using `performBlockAndWait:` will block the calling thread until the block completes, which is suitable when you need a result immediately.  Choose `performBlock:` for asynchronous operations to prevent blocking the UI thread.