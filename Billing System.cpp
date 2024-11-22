#include <bits/stdc++.h>
using namespace std;

int main()
{
    string name,add;
    cout<<"\t Welcome to my shop"<<endl;
    cout<<"\t--------------------"<<endl<<endl;
    cout<<"Enter customer name \t";
    getline(cin,name);
    cout<<"Enter customer address \t";
    getline(cin,add);
    cout<<endl;
    cout<<"\aNote: If you want to close then enter \'null\'"<<endl<<endl;


    int c,i,t=0;
    string f;
    vector<string>in;   //item name
    vector<int>ip;  //item price
    while(1)
    {
        cout<<"Enter item name\t\t";
        cin>>f;
        string b;
        for(auto u:f)
            b+=tolower(u);
        b[0]=toupper(b[0]);
        if(b=="Null")
            break;
        in.push_back(b);
        cout<<"Enter price\t\t";
        cin>>c;
        ip.push_back(c);
    }                                   //Input Finish



    cout<<endl<<endl<<endl;
    cout<<"\t Forid Store"<<endl;
    cout<<"\t-------------"<<endl<<endl;

    add="Address : "+add;           //include address string for create align
    cout<<"Name: "<<name<<setw(28)<<right<<add<<endl<<endl;
    cout<<setw(15)<<left<<"Item name"<<setw(22)<<right<<"Price"<<endl;
    cout<<"--------------------------------------"<<endl;
    for(i=1;i<=ip.size();i++)
    {
        cout<<setw(15)<<left<<in[i-1]<<setw(22)<<right<<ip[i-1]<<endl;
        cout<<"--------------------------------------"<<endl;
    }
    t=accumulate(ip.begin(),ip.end(),0);    //vector sum
    //for(auto u:ip)
    //   t+=u;
    cout<<"Total item : "<<ip.size();
    cout<<setw(16)<<"Total : "<<setw(7)<<right<<t<<endl<<endl;
    cout<<"\t Thank You For Visiting"<<endl;
    return 0;
}
