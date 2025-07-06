const prementSucces = true;
const mark = 90;

function enroll(){
    console.log("Course enrolling is in process.");
    const promise = new Promise((resolve, reject)=>{
        setTimeout(()=>{
            if(prementSucces){
                resolve();
            }
            else {
                reject ("Prement Failed!");
            }
        },2000);
    });
    return promise;
}

function process(){
    console.log("Course on progress...");
    const promise = new Promise((resolve, reject)=>{
        setTimeout(()=>{
            if(mark >= 80){
                resolve();
            }
            else {
                reject("You could not have enought mark to get certificate.");
            }
        },2000);
    });
    return promise;
}

function getCertificate(){
    console.log("Preparing your certificate.");
    const promise = new Promise ((resolve)=>{
        setTimeout(()=>{
            resolve("Congrates! you got the certificate.");
        }, 1000);
    });
    return promise;
}

enroll()
    .then(process)
    .then(getCertificate)
    .then((value)=>{
        console.log(value);
    })
    .catch((err)=>{
        console.log(err);
    })